from flask import Flask, request, jsonify, render_template
import os

from werkzeug.utils import secure_filename  # 导入 secure_filename

app = Flask(__name__)
UPLOAD_FOLDER = 'uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

# 允许的文件扩展名
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

def allowed_file(filename):
    # 检查文件扩展名
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/index')
def index():
    return render_template('index.html')

@app.route('/')
def home():
    return "Hello, Flask!"

@app.route('/echo', methods=['POST'])
def echo():
    data = request.json
    return jsonify(data)

@app.route('/upload', methods=['POST'])
def upload_file():
    # 检查请求中是否包含文件部分
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'}), 400

    file = request.files['file']

    # 如果用户没有选择文件
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400

    # 保存文件
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)  # 确保文件名安全
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        return jsonify({'message': 'File uploaded successfully', 'filename': filename}), 200

    return jsonify({'error': 'File type not allowed'}), 400

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
