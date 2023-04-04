from flask import Flask, render_template, request, session, redirect, url_for, send_file, jsonify
import mysql.connector
from PIL import Image
import io


db = mysql.connector.connect(
        host='localhost',
        user='root',
        password='password123',
        database='shop'
    )
app = Flask(__name__)
app.secret_key = "so_secret_is_the_key"
cursor = db.cursor()

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/aboutus')
def aboutus():
    return render_template('aboutus.html')

@app.route('/login', methods=['GET', 'POST']) 
def login():
    msg = ''
    if request.method=='POST':
        email = request.form['Customer_Email']
        password1 = request.form['password1']
        cursor.execute('SELECT * FROM customers WHERE Customer_Email = %s AND password1 = %s', (email, password1,))
        record = cursor.fetchone()
        if record:
            session['loggedin'] = True
            session['Customer_Email'] = record[4]
            return redirect(url_for('example'))
        else:
            msg='Incorrect email or password'
    return render_template('login.html')
@app.route('/register', methods=['GET', 'POST'])
def register():
    msg = ''
    if request.method == 'POST':
        name = request.form['Name_Of_Customer']
        address = request.form['Customer_Address']
        phone_number = request.form['Customer_Phone_Number']
        email = request.form['Customer_Email']
        password1 = request.form['password1']
        cursor.execute("SELECT MAX(Customer_ID) FROM customers")
        max_id = cursor.fetchone()[0]
        new_id = max_id + 1 if max_id is not None else 1
        cursor.execute("INSERT INTO customers (Customer_ID, Name_Of_Customer, Customer_Address, Customer_Phone_Number, Customer_Email, password1, loggedin) VALUES (%s, %s, %s, %s, %s, %s, %s)", (new_id, name, address, phone_number, email, password1, True))
        db.commit()
        msg = 'You have successfully registered!'
    return render_template('register.html', msg=msg)

@app.route('/logout')
def logout():
    session.pop('loggedin', None)
    session.pop('Customer_Email', None)
    return redirect(url_for('login'))

@app.route('/image/<int:image_id>')
def image(image_id):
    cursor = db.cursor()
    cursor.execute(f"SELECT image FROM art WHERE image_id={image_id}")
    result = cursor.fetchone()
    image_path = result[0]
    with Image.open(image_path) as image:
        image.thumbnail((500, 500))
        img_io = io.BytesIO()
        image.save(img_io, 'JPEG')
        img_io.seek(0)
        return send_file(img_io, mimetype='image/jpg')

@app.route('/products/<int:Product_ID>')
def products(Product_ID):
    cursor = db.cursor()
    cursor.execute('SELECT * FROM Products WHERE Product_ID=%s', (Product_ID,))
    rows = cursor.fetchall()
    result = []
    for row in rows:
        product = {
            'Product_ID': row[0],
            'Name_of_Product': row[1],
            'Product_Pricing': row[2],
            'Product_Availability': row[3],
            'Year_Of_Release': row[4],
            'Company_ID': row[5]
        }
        result.append(product)
    return jsonify(result)

@app.route('/company/<int:Company_ID>')
def get_company(Company_ID):
    cursor = db.cursor()
    cursor.execute("SELECT * FROM Company WHERE Company_ID=%s", (Company_ID,))
    rows = cursor.fetchall()
    result = []
    for row in rows:
        company_info = {
            'Company_ID': row[0],
            'Name_of_Company': row[1],
            'Company_Location': row[2],
            'Company_Manager': row[3]
        }
        result.append(company_info)
    return jsonify(result)

@app.route('/example', defaults={'company_filter': None}) # - added
@app.route('/example/<company_filter>')
def example(company_filter):
    cursor = db.cursor()
    # Fetch data from Company, Products, and Art tables
    cursor.execute('SELECT * FROM Company')
    companies = cursor.fetchall()
    if company_filter is not None:
        cursor.execute('SELECT * FROM Products WHERE Company_ID=%s', (company_filter,))
    else:
        cursor.execute('SELECT * FROM Products')
    products = cursor.fetchall()
    cursor.execute('SELECT * FROM art')
    art = cursor.fetchall()
    cursor.close()
    data = {
        'companies': companies,
        'products': products,
        'art': art,
    }
    return render_template('exampleproduct.html', data=data, company_filter=company_filter)

@app.route('/update_product_availability', methods=['POST'])
def update_product_availability():
    product_id = request.form['product_id']
    new_availability = 'Not Available'
    cursor.execute('UPDATE Products SET Product_Availability = %s WHERE Product_ID = %s', (new_availability, product_id))
    db.commit()
    return redirect(url_for('example'))

if __name__ == '__main__':
    app.run()