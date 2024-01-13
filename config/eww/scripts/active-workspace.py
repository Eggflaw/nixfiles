import hypr
import socket

client_socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
client_socket.connect(hypr.socket_path2)

active_workspace = hypr.get_active_workspace()

print(active_workspace)


while True:
    data = client_socket.recv(1024)
    result = hypr.filter_event(data.decode(), "workspace")
    if result:
        print(f"\n{result}", end=' ')


client_socket.close()
