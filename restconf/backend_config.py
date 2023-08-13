"""
backend_config.py

This module contains functions for handling the backend configuration.
This is called by cmd_input.py for cmd commands
"""
import json
from datetime import datetime
import requests
from config import ACCEPT_HEADER, USERNAME, PASSWORD, CONTENT_TYPE_HEADER
from requests.auth import HTTPBasicAuth
import urllib3


def take_backup(file_name):
    """
    Retrieve the running configuration from devices and save backups to files.

    Parameters:
        file_name (str): Path to the file containing a list of device IP addresses or hostnames.

    Returns:
        None
    """
    with open(file_name, "r",encoding="utf-8") as file:
        for each_line in file:
            # urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
            url = f"https://{each_line.strip()}:443/restconf/data/ietf-interfaces:interfaces"
            response = requests.get(
                url,
                headers=ACCEPT_HEADER,
                auth=HTTPBasicAuth(USERNAME, PASSWORD),
                verify=False,
                timeout=30
            )
            now = datetime.now()
            with open(f"{each_line.strip()}_{now.strftime('_%m_%d_%Y_%H_%M_%S')}","a",encoding="utf-8") as file:
                json.dump(response.json(), file, indent=2)


def interface_config(file_name,input_data):
    with open(file_name, "r",encoding="utf-8") as file:
        for each_line in file:
            print(each_line)
            with open(input_data,"r") as config: 
                data=json.load(config)
                for i in range(int(data["number_of_interfaces"])):
                    interface=data["interface"+str(i)]
                    if interface['name'].startswith("Gig"):
                        int_type="ethernetCsmacd"
                    elif interface['name'].startswith("Loop"):
                        int_type="softwareLoopback"
                    payload= {
                        "ietf-interfaces:interface":
                                    {
                                    "name": f"{interface['name']}",
                                    "description": f"{interface['description']}",
                                    "type": f"iana-if-type:{int_type}",
                                    "enabled": True,
                                    "ietf-ip:ipv4": {
                                    "address": [
                                        {
                                        "ip": f"{interface['ip_address']}",
                                        "netmask": f"{interface['subnet_mask']}"
                                        }
                                    ]
                                }    
                            }
                        }
                    url = f"https://{each_line.strip()}:443/restconf/data/ietf-interfaces:interfaces/interface={interface['name']}"
                    response = requests.get(
                        url,
                        headers=ACCEPT_HEADER,
                        auth=(USERNAME, PASSWORD),
                        verify=False,
                        timeout=30
                    )
                    if response.status_code == 200:
                        print(f"response code={response.status_code}")
                        response = requests.put(
                                url,
                                headers=CONTENT_TYPE_HEADER,
                                auth=HTTPBasicAuth(USERNAME, PASSWORD),
                                verify=False,
                                json=payload,
                                timeout=30
                            )
                    elif response.status_code == 404:
                        print(f"response code={response.status_code}")
                        url=f"https://{each_line.strip()}:443/restconf/data/ietf-interfaces:interfaces"
                        response = requests.post(
                                url,
                                headers=CONTENT_TYPE_HEADER,
                                auth=HTTPBasicAuth(USERNAME, PASSWORD),
                                verify=False,
                                json=payload,
                                timeout=30
                            )
                    print(response.text)
                    print(f"response code={response.status_code}")
                