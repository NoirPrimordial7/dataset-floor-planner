import os, requests, json
from duckduckgo_search import DDGS



# Config
SEARCH_TERM = "floor plan blueprint"
NUM_IMAGES = 300
DEST_FOLDER = "images"
ANNO_FOLDER = "annotations"

# Create folders
os.makedirs(DEST_FOLDER, exist_ok=True)
os.makedirs(ANNO_FOLDER, exist_ok=True)

# Download links
with DDGS() as ddgs:
    results = ddgs.images("floor plan", max_results=NUM_IMAGES)
    
print(f"Found {len(results)} image URLs")

# Start numbering from existing files
existing = [f for f in os.listdir(DEST_FOLDER) if f.startswith("plan_")]
start_index = len(existing) + 1

for i, result in enumerate(results, start=start_index):
    img_url = result["image"]
    ext = os.path.splitext(img_url)[1].split("?")[0]
    if ext.lower() not in [".jpg", ".jpeg", ".png"]:
        ext = ".jpg"
    filename = f"plan_{i:03d}{ext}"
    img_path = os.path.join(DEST_FOLDER, filename)
    json_path = os.path.join(ANNO_FOLDER, f"plan_{i:03d}.json")

    try:
        img = requests.get(img_url, timeout=10)
        img.raise_for_status()
        with open(img_path, "wb") as f:
            f.write(img.content)
        print(f"[OK] Saved {filename}")
        # Create empty JSON
        empty = {"walls": [], "doors": [], "windows": [], "furniture": [], "fixtures": []}
        with open(json_path, "w") as f:
            json.dump(empty, f, indent=2)
    except Exception as e:
        print(f"[FAIL] {filename}: {e}")

print("✅ All done.")
