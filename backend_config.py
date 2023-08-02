from ncclient import manager
from xml.dom.minidom import parseString
import config

def running_config(device_details_list):
    """This function to pull config from list of devices

    Args:
        device_details_list ("string"): file name

    Returns:
        xml: creates file and return success
    """
    for each_device in device_details_list:
        print(each_device)
        ssh=manager.connect(**each_device)
        result=ssh.get_config(source="running")
        write_to_file(each_device,result)
    return f"config taken for all devices"

def convert_to_pretty_config(result):
    return parseString(result.xml).toprettyxml()

def write_to_file(each_device,result):
    with open(each_device["host"],"w") as file:
            file.write(convert_to_pretty_config(result))

def get_device_details(file_name):
    """
    This function will read file and create dictionary required for ncclient
    """
    device_details_list=[]
    with open(file_name,"r") as file:
        for each_ip in file:
            each_device_details={
                    "host":each_ip.strip(),
                    "port":config.PORT,
                    "username":config.USERNAME,
                    "password":config.PASSWORD,
                    "hostkey_verify":False
                }
            device_details_list.append(each_device_details)
    return device_details_list

def interface_list(device_details_list):
    """
    This function will print interface list
    """
    interface_filter="""
    <filter>
        <interfaces-state xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces>
            <interface></interface>
        </interfaces-state>
    </filter>
    """
    for each_device in device_details_list:
        interfaces_list_on_device=[]
        with manager.connect(**each_device) as ssh:
            result = ssh.get(filter=('xpath', '/interfaces-state'))
            interfaces = result.data.xpath("//*[local-name()='interface']")
            print("List of Interfaces:")
            for interface in interfaces:
                name = interface.find('.//{urn:ietf:params:xml:ns:yang:ietf-interfaces}name').text
                print(f"- {name}")
                interfaces_list_on_device.append(name)
        write_to_file(each_device,interfaces_list_on_device)
    return "success"

def interface_config(device_details_list,interface_details):
    """
    This function will configure interfaces on device
    """
    for each_device in device_details_list:
        ssh = manager.connect(**each_device)
        for each_interface in interface_details:
            each_word=each_interface.split(",")
            payload=f"""
            <config>
            <interfaces xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces">
                <interface>
                    <name>{each_word[0]}</name>
                    <description>{each_word[3]}</description>
                    <type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:ethernetCsmacd</type>
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
            print(payload)
            result=ssh.edit_config(payload,target="running")
    return "successfuly configured interfaces"