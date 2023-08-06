"""
backend_config.py

This module contains functions for interacting with network devices using the ncclient library.
"""
from xml.dom.minidom import parseString
from ncclient import manager
import config
from xmltodict import parse


def running_config(device_details_list):
    """
    Retrieve and save the running configuration of each device in the given list.

    Args:
        device_details_list (list): A list of dictionaries, each containing device details.

    Returns:
        str: A message indicating success.
    """
    for each_device in device_details_list:
        print(each_device)
        ssh = manager.connect(**each_device)
        result = ssh.get_config(source="running")
        with open(each_device["host"], "w",encoding='utf-8') as file:
            file.write(convert_to_pretty_config(result))
    return "config taken for all devices"


def convert_to_pretty_config(result):
    """
    Convert the XML result into a pretty-printed XML format.

    Args:
        result (str): The XML result obtained from ncclient.

    Returns:
        str: The pretty-printed XML format of the result.
    """
    return parseString(result.xml).toprettyxml()


def get_device_details(file_name):
    """
    Read a list of device IP addresses from a file and create a list of device details.

    Args:
        file_name (str): The name of the file containing the device IP addresses.

    Returns:
        list: A list of dictionaries, each containing device details.
    """
    device_details_list = []
    with open(file_name, "r",encoding='utf-8') as file:
        for each_ip in file:
            each_device_details = {
                "host": each_ip.strip(),
                "port": config.PORT,
                "username": config.USERNAME,
                "password": config.PASSWORD,
                "hostkey_verify": False,
            }
            device_details_list.append(each_device_details)
    return device_details_list


def interface_list(device_details_list):
    """
    Retrieve and print the list of interfaces for each device in the given list.

    Args:
        device_details_list (list): A list of dictionaries, each containing device details.

    Returns:
        str: A message indicating success.
    """
    int_filter="""
    <filter>
        <interfaces xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces">

        </interfaces>
    </filter>
    """
    for each_device in device_details_list:
        print(each_device)
        ssh = manager.connect(**each_device)
        result = ssh.get_config(filter=int_filter,source="running")
        output=parse(result.xml)["rpc-reply"]["data"]["interfaces"]["interface"]
        for each_interface in output:
            try:
                ip_add,mask=each_interface["ipv4"]["address"]["ip"],each_interface["ipv4"]["address"]["netmask"]
                print(f"{each_interface['name']},ip address={ip_add},subnet_mask={mask}")
            except:
                print(f"{each_interface['name']} ip mask not configured")
            
    return output


def interface_config(device_details_list, interface_details):
    """
    Configure the specified interfaces on each device in the given list.

    Args:
        device_details_list (list): A list of dictionaries, each containing device details.
        interface_details (list): A list of interface details.

    Returns:
        str: A message indicating success.
    """
    for each_device in device_details_list:
        ssh = manager.connect(**each_device)
        for each_interface in interface_details:
            each_word = each_interface.split(",")
            if each_word[0].startswith("Gig"):
                interface_type="ethernetCsmacd"
            elif each_word[0].startswith("Loop"):
                interface_type="softwareLoopback"
            payload = f"""
            <config>
            <interfaces xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces">
                <interface>
                    <name>{each_word[0]}</name>
                    <description>{each_word[3]}</description>
                    <type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:{interface_type}</type>
                    <enabled>true</enabled>
                    <ipv4 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip">
                        <address>
                            <ip>{each_word[1]}</ip>
                            <netmask>{each_word[2]}</netmask>
                        </address>
                    </ipv4>
                    <ipv6 xmlns="urn:ietf:params:xml:ns:yang:ietf-ip"/>
                </interface>
            </interfaces>
            </config>
            """
            # print(payload)
            ssh.edit_config(payload, target="running")
    return f"success\n{payload}"
