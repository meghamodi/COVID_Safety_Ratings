from flask import Flask, render_template, request
# from rating import ratingLogic
# from rating import storesList

from flask import Flask, render_template, request, redirect
from flaskext.mysql import MySQL
from flask import Flask, jsonify

app = Flask(__name__)

app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = '12345'
app.config['MYSQL_DATABASE_DB'] = 'places'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql = MySQL()
mysql.init_app(app)
conn = mysql.connect()
cursor = conn.cursor()

# @app.route('/search', methods=['GET', 'POST'])
# def search():
#     if request.method == "POST":
#         places = request.form['place']
#         # search by place
#         cursor.execute("SELECT store_name,store_address,store_zipcode FROM Stores WHERE store_name LIKE %s" ,(places))
#         conn.commit()
#         data = cursor.fetchall()
#         # all in the search box will return all the tuples
#         if len(data) == 0:
#             cursor.execute("SELECT store_name,store_address FROM Stores")
#             conn.commit()
#             data = cursor.fetchall()
#         return render_template('place_search.html', data=data)
#     return render_template('place_search.html')

# nithya part
# @app.route("/rating")
# def rating():
#     return render_template("rating.html")
#
# @app.route("/safetyratings", methods=['POST'])
# def safetyratings():
#     dist = request.form['dist']
#     sanitize = request.form['sanitize']
#     avail = request.form['avail']
#     precaution = request.form['precaution']
#     density = request.form['density']
#     specialhr = request.form['specialhr']
#     aisle = request.form['aisle']
#
#     ratingform = [["dist", dist], ["sanitize",sanitize], ["avail",avail], ["precaution",precaution], ["density",density], ["specialhr",specialhr], ["aisle",aisle]]
#
#     stores = ratingLogic.processRatings(ratingform)
#     return render_template("index.html", title='Home', noHomePageLink=True)


# @app.route("/storesList/restaurants")
# def stores_list(category):
#     places = request.form['place']
#     # search by place
#     cursor.execute("SELECT store_name,address FROM Stores WHERE category=$cat['category']")
#     conn.commit()
#     data = cursor.fetchall()
#     # all in the search box will return all the tuples
#     if len(data) == 0:
#         cursor.execute("SELECT store_name,address FROM Stores")
#         conn.commit()
#         data = cursor.fetchall()
#     return render_template("stores.html", title="Stores List", stores=data)
#
# @app.route("/")
# def home():
#     return render_template("index.html", title='Home', noHomePageLink=True)
@app.route('/search', methods=['GET', 'POST'])
def search():
    if request.method == "POST":
        loc = request.form['place']
        places = '%' + loc +'%'
        # search by author or book
        cursor.execute("SELECT * FROM Stores WHERE store_name LIKE %s",(places))
        conn.commit()
        data = cursor.fetchall()
        print(data)
        # all in the search box will return all the tuples
        if len(data) == 0:
            cursor.execute("SELECT store_name,address FROM Stores")
            conn.commit()
            data = cursor.fetchall()
        return render_template('search_page.html', data=data)
    return render_template('search_page.html')

def res_ratings():
    cursor.execute('''SELECT * FROM Stores WHERE category = "Restaurants" ''')
    restaur = cursor.fetchall()
    payload = []
    content = {}
    for result in restaur:
        content = {'name': result[1], 'category': result[2], 'address': result[3], 'state': result[5],'open hours': result[6], 'star rating': result[8],'image':result[11]}
        payload.append(content)
        content = {}
    return jsonify(payload)

@app.route("/storesList/restaurants")
def show_resratings():
    res = res_ratings().get_json()
    #print(res)
    return render_template("stores.html",result=res)

def grocery_ratings():
    cursor.execute('''SELECT * FROM Stores WHERE category = "Department Stores_Grocery" ''')
    grocery = cursor.fetchall()
    payload = []
    content = {}
    for result in grocery:
        content = {'name': result[1], 'category': result[2], 'address': result[3], 'state': result[5],'open hours': result[6], 'star rating': result[8],'image':result[11]}
        payload.append(content)
        content = {}
        print(content)
    return jsonify(payload)

@app.route("/storesList/Grocery")
def show_grocratings():
    res = grocery_ratings().get_json()
    #print(res)
    return render_template("stores.html",result=res)

def salon_ratings():
    cursor.execute('''SELECT * FROM Stores WHERE category = "Hair Salons" ''')
    salons = cursor.fetchall()
    payload = []
    content = {}
    for result in salons:
        content = {'name': result[1], 'category': result[2], 'address': result[3], 'state': result[5],'open hours': result[6], 'star rating': result[8],'image':result[11]}
        payload.append(content)
        content = {}
    return jsonify(payload)

@app.route("/storesList/Salons")
def show_salonratings():
    res = salon_ratings().get_json()
    #print(res)
    return render_template("stores.html",result=res)


def page_store(name):

    cursor.execute("SELECT * FROM Stores WHERE store_name = %s" ,(name))
    rv = cursor.fetchall()
    payload = []
    content = {}
    for result in rv:
        content = {'name': result[1], 'category': result[2], 'address': result[3],'county':result[4], 'state': result[5],'open hours': result[6],'No_of_reviews':result[7], 'star rating': result[8],'latitude':result[9],'longitude':result[10],'image':result[11]}
        payload.append(content)
        content = {}
    return jsonify(payload)
    return render_template('store_page.html', data=str(rv))

@app.route('/store/<name>')
def show_page_store(name):
    res = page_store(name).get_json()
    #print(res)
    return render_template("stores.html",result=res)

@app.route('/insert_ratings')
def insert_rating():

    # cursor.execute("SELECT * FROM Stores WHERE store_name = %s" ,(name))
    # rv = cursor.fetchall()
    return render_template('store_rating.html')

if __name__ == '__main__':
    app.run()
