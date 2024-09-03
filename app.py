from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "home_task_snir"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=443, ssl_context='adhoc')
