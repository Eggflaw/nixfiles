import hypr
import json

# TODO: count the amount of workspaces and build a widget
workspace_sum = hypr.count_workspaces()

workspace_arr = [i for i in range(1, workspace_sum + 2)]
print(json.dumps(workspace_arr))
