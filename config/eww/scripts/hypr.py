import socket
import os
import json

# NOTE: This module is required by other scripts

his = os.getenv("HYPRLAND_INSTANCE_SIGNATURE")

socket_path1 = f"/tmp/hypr/{his}/.socket.sock"
socket_path2 = f"/tmp/hypr/{his}/.socket2.sock"


def connect_socket1():
    socket1 = socket.create_connection(socket_path1)
    return socket1


def get_active_workspace():
    client_socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    client_socket.connect(socket_path1)

    client_socket.send("[-j]/activeworkspace".encode())
    data = client_socket.recv(1024)

    list = json.loads(data)

    client_socket.close()
    return list['id']


def filter_event(data, selected_event):
    event_list = []
    split_line_result = data.splitlines()
    for value in split_line_result:
        pattern_result = str(value).split(">>")
        event_list.append(pattern_result)

    for event in event_list:
        if selected_event == str(event[0]):
            return event[1]
