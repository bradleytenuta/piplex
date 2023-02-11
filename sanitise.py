# Example of how to use:
# python sanitise.py -d="C:\Users\Bradley\Documents\Dev\piplex\temp"

import os
import argparse
import re
from pathlib import Path

def is_video_format(name):
    valid_file_extensions = ['srt', 'avi', 'mp4', 'mkv']
    if any(ext in name for ext in valid_file_extensions):
        return True
    return False

def is_valid_format(name):
    regex_valid_file_format = r'^[a-z,A-Z,1-9,.]*\.[1-9]{4}\.([a-z]{3}|[a-z]{4})$'
    regex_valid_folder_format = r'^(?!.*\.).* \([1-9]{4}\)$'
    return re.search(regex_valid_file_format, name) or re.search(regex_valid_folder_format, name)

def rename(file, name):
    file_path = file.path.decode('utf-8')
    path = Path(file_path)

    # TODO: Create new file name.
    new_name = ""
    
    print("Renaming: '{}' to: '{}'".format(name, new_name))
    # TODO: Uncomment when happy:
    # os.rename(file_path, os.path.join(path, new_name))

def clean_metadata(file):
    # TODO: Clean up metadata from file.
    print("")

def scan_directory(directory):
    for file in os.scandir(directory):
        name = file.name.decode('utf-8')

        if file.is_file() and not is_video_format(name):
            print("WARNING - Skipping file found with invalid file type: {}", file.path)
            continue

        if not is_valid_format(name):
            rename(file, name)
        
        if file.is_dir():
            scan_directory(file.path)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(prog='sanitise_files')
    parser.add_argument('-d', '--directory')
    args = parser.parse_args()
    scan_directory(os.fsencode(args.directory))