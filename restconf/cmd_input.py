import argparse
import backend_config

def get_device_details():
    parser=argparse.ArgumentParser(description="This program takes file input")
    parser.add_argument("--filename",help="Enter file name")
    parser.add_argument("--operation",help="Enter which operation need to be done. Refer readme for supported operations")
    args=parser.parse_args
    if args["operation"].lower()=="take_backup":
        backend_config.take_backup(args["filename"])