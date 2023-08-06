"""
app.py

This module contains the Flask application that serves endpoints for interacting with backend configurations.
"""
from flask import Flask, request
import backend_config

app = Flask(__name__)


@app.route("/running", methods=["POST"])
def running_config():
    """
    Handle the "/running" endpoint to retrieve and return the running configurations.

    Returns:
        The result of running_config() from the backend_config module.
    """
    name_file = request.args["file_name"]
    print(name_file)
    device_details_list = backend_config.get_device_details(name_file)
    result = backend_config.running_config(device_details_list)
    return result


@app.route("/interface_list", methods=["POST"])
def interface_list():
    """
    Handle the "/interface_list" endpoint to retrieve and return a list of interfaces.

    Returns:
        The result of interface_list() from the backend_config module.
    """
    name_file = request.args["file_name"]
    device_details_list = backend_config.get_device_details(name_file)
    result = backend_config.interface_list(device_details_list)
    return result


@app.route("/int_config", methods=["POST"])
def interface_config():
    """
    Handle the "/int_config" endpoint to retrieve and return the configuration of specified interfaces.

    Returns:
        The result of interface_config() from the backend_config module.
    """
    name_file = request.args["file_name"]
    device_details_list = backend_config.get_device_details(name_file)
    number_of_interfaces = request.args["number_of_interfaces"]
    interface_details_list = []
    print(number_of_interfaces)
    for i in range(int(number_of_interfaces)):
        each_interface = request.args[f"interface{i}"]
        interface_details_list.append(each_interface)
    result = backend_config.interface_config(
        device_details_list, interface_details_list
    )
    return result


if __name__ == "__main__":
    app.run()
