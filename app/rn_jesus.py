import random
import os
from flask import Flask, render_template, jsonify

# Module docstring
"""
This is the DND dice Flask application
"""


app = Flask(__name__)



def random_thought_generator():
    """
    Generates a random thought from a predefined list of thoughts.
    Returns:
        str: A random thought.
    """
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
    """
    Renders the index page.
    Returns:
        str: The rendered index HTML page.
    """
    return render_template("index.html")


@app.route("/get-thought")
def get_thought():
    """
    Returns a random thought as a JSON response.
    Returns:
        jsonify: A JSON object containing the random thought.
    """
    return jsonify({"thought": random_thought_generator()})




if __name__ == "__main__":
    app.run(port=os.environ.get("PORT", 3000),host="0.0.0.0")
