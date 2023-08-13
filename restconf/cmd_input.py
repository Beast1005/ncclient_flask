"""
cmd_input.py

This module contains functions related to handling command-line input.
"""
import argparse
import backend_config


def get_device_details():
    """
    Parse command-line arguments and perform the specified operation.

    Returns:
        None
    """
    parser = argparse.ArgumentParser(description="This program takes file input")
    parser.add_argument("--filename", help="Enter file name", type=str)
    parser.add_argument(
        "--operation",
        help="Enter which operation need to be done. Refer readme for supported operations",
        type=str,
    )
    args = parser.parse_args()
    if args.operation.lower() == "take_backup":
        backend_config.take_backup(args.filename)
    elif args.operation.lower()=="config_int":
        backend_config.take_backup(args.filename)


if __name__ == "__main__":
    get_device_details()
