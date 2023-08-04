"""
backend_config.py

This module contains functions for handling the backend configuration.
This is called by cmd_input.py for cmd commands
"""
import json
from datetime import datetime
import requests
import config


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
            url = f"https://{each_line}/restconf/data/Cisco-IOS-XE-native:native"
            response = requests.get(
                url,
                headers=config.ACCEPT_HEADER,
                auth=(config.USERNAME, config.PASSWORD),
                verify=False,
                timeout=30
            )
            now = datetime.now()
            with open(f"{each_line}_{now.strftime('_%m_%d_%Y_%H_%M_%S')}","a",encoding="utf-8") as file:
                json.dump(response.json(), file, indent=2)
