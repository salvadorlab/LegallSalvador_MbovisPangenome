import json 
import glob 
import re 

json_files = glob.glob("*.json")

for file in json_files: 
    id = re.sub(".results.json","",file)
    f = open(file)
    data = json.load(f)
    print("{},{}".format(id,data['sublin']))
    f.close()


