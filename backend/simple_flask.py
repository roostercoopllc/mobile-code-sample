from flask import Flask, jsonify
import inspirobot

app = Flask(__name__)

@app.route('/')
def simple_inspire():    
    quote = inspirobot.generate()  # Generate Image
    return jsonify({'quote_url': quote.url})  # Print the url

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')