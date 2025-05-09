from roboflow import Roboflow
from ultralytics import YOLO
import os

rf = Roboflow(api_key=os.getenv("ROBOFLOW_API_KEY"))

project = rf.workspace("floorplan-y38xx").project("floorplans-seg")
version = project.version(7)
dataset = version.download("yolov11")

room_model_name = "floorplan"
save_file_name= f"/workspace/{room_model_name}_v10.pt"
dataset_version = 7

model = YOLO("yolo11x.pt")
results = model.train(data=f"/workspace/{room_model_name}-{dataset_version}/data.yaml")

model.save(save_file_name)
