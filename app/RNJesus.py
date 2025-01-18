import random
import os
from flask import Flask, render_template, jsonify

app = Flask(__name__) 



def random_thought_generator():
    thoughts = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "11", 
        "12",
        "13",
        "14",
        "15",
        "16",
        "17",
        "18",
        "19",
        "20"
    ]
    return random.choice(thoughts)

@app.route("/")
def index():
          return render_template("index.html") 


@app.route("/get-thought")
def get_thought():
    return jsonify({"thought": random_thought_generator()})




if __name__ == "__main__":
    app.run(port=os.environ.get("PORT", 3000),host="0.0.0.0")
