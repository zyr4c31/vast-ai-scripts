model_name = "floorplans-seg"
model_file_name= f"/workspace/{model_name}_v1.pt"
save_file_name= f"/workspace/{model_name}_v1.pt"

from roboflow import Roboflow
import os

rf = Roboflow(api_key=os.getenv("ROBOFLOW_API_KEY"))
project = rf.workspace("floorplan-y38xx").project("floorplans-seg")
version = project.version(5)
dataset = version.download("yolov11")

from ultralytics import YOLO

model = YOLO("yolo11x-seg.pt")
results = model.train(data=f"/workspace/{model_name}-5/data.yaml")

model.save(save_file_name)
