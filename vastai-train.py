from roboflow import Roboflow
from ultralytics import YOLO
import os

rf = Roboflow(api_key=os.getenv("ROBOFLOW_API_KEY"))

project = rf.workspace("floorplan-y38xx").project("rooms-bb")
version = project.version(10)
dataset = version.download("yolov11")

room_model_name = "rooms-bb"
save_file_name= f"/workspace/{room_model_name}_v1.pt"
version = 10

model = YOLO("yolo11x.pt")
results = model.train(data=f"/workspace/{room_model_name}-{version}/data.yaml")

model.save(save_file_name)
