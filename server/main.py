from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, Flask!"

@app.route('/echo', methods=['POST'])
def echo():
    data = request.json
    return jsonify(data)

@app.route('/middle/user/code', methods=['POST'])
def sendcode():
    print(request.content_type)
    print(request.content_encoding)
    print(request.get_data())

    return "hello"
    # data = request.json
    # return jsonify(data)

@app.route('/middle/data/report', methods=['POST'])
def datgareport():
    print(request.headers)
    print(request.content_type)
    print(request.content_encoding)
    print(request.form)

    # return "hello"
    # data = request.json
    # return jsonify(data)

    data = {
        'data': {
            'token': 'John Doe',
            'expire': 30
        },
        'message': 'success',
        'code': 1000
    }
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8008)
