from flask import Flask,request
import backend_config
import time

app=Flask(__name__)

@app.route("/running",methods=["POST"])
def running_config():
    """Route take running config on listed devices
    Params: Takes one input using post file_name with list of IP. Each device in new list
    Returns:
        _type_: file gets created with xml
    """
    name_file=request.args["file_name"]
    #Function def defined in backendconfig
    device_details_list=backend_config.get_device_details(name_file)
    #Function def defined in backendconfig
    result=backend_config.running_config(device_details_list)
    return result
    
@app.route("/interface_list",methods=["POST"])
def interface_list():
    """Creates list of interfaces file on a device
    Params: Takes one input using post file_name with list of IP. Each device in new list
    Returns:
        _type_: file gets created with xml
    """
    name_file=request.args["file_name"]
    #Function def defined in backendconfig
    device_details_list=backend_config.get_device_details(name_file)
    #Function def defined in backendconfig
    result=backend_config.interface_list(device_details_list)
    return result
    
@app.route("/int_config",methods=["POST"])
def interface_config():
    """Configures interfaces on device
    Params:
      file_name:: list of IP.
      Number_of_interface: Int
      interface0: interfacename,ip,subnetmask
    Returns:
        _type_: _description_
    """
    name_file=request.args["file_name"]
    #Function def defined in backendconfig
    device_details_list=backend_config.get_device_details(name_file)
    number_of_interfaces=request.args["number_of_interfaces"]
    interface_details_list=[]
    print(number_of_interfaces)
    for i in range(int(number_of_interfaces)):
        each_interface=request.args[f"interface{i}"]
        interface_details_list.append(each_interface)
    #Function def defined in backendconfig
    result=backend_config.interface_config(device_details_list,interface_details_list)
    return result
    
if __name__=="__main__":
    app.run()