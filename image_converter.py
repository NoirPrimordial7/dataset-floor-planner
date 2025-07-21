from PIL import Image
import os

input_folder = "images"
output_folder = "images_rgb"

os.makedirs(output_folder, exist_ok=True)

for filename in os.listdir(input_folder):
    if filename.lower().endswith((".png", ".jpg", ".jpeg")):
        path = os.path.join(input_folder, filename)
        img = Image.open(path)
        rgb_img = img.convert("RGB")
        rgb_img.save(os.path.join(output_folder, filename))

print("✅ All images converted to RGB.")
