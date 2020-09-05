from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
import json
import os
import math
from datetime import datetime


with open('config.json', 'r') as file_:
    params = json.load(file_)["params"]

app = Flask(__name__)
app.secret_key = 'my-secret-key'
app.config['SQLALCHEMY_DATABASE_URI'] = params['remote_uri']
db = SQLAlchemy(app)

class Volunteers(db.Model):
    SerialNumber = db.Column(db.Integer, primary_key=True)
    EventNumber = db.Column(db.Integer, nullable=False)
    Age = db.Column(db.Integer, nullable=False)
    Name = db.Column(db.String(120), nullable=False)
    Event = db.Column(db.String(120), nullable=False)
    Duty = db.Column(db.String(120), nullable=False)
    RegistrationDate = db.Column(db.String(120), nullable=False)
    PhoneNumber = db.Column(db.String(120), nullable=False)

    def __repr__(self):
        return self.id

class Events(db.Model):
    SerialNumber = db.Column(db.Integer, primary_key=True)
    EventNumber = db.Column(db.Integer, nullable=False)
    EventName = db.Column(db.String(80), nullable=False)
    EventDate = db.Column(db.String(21), nullable=False)
    Tagline = db.Column(db.String(120), nullable=False)
    Description = db.Column(db.String(120), nullable=False)
    slug = db.Column(db.String(30), nullable=False)

    def __repr__(self):
        return self.id

class Feedbacks(db.Model):
    SerialNumber = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(80), nullable=False)
    Email = db.Column(db.String(21), nullable=False)
    Feedback = db.Column(db.String(120), nullable=False)
    Date = db.Column(db.String(12), nullable=False)

    def __repr__(self):
        return self.id


@app.route("/")
def home():
    events = Events.query.filter_by().all()
    last=int(math.ceil(len(events)/int(params['no_of_events'])))
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page=1
    page=int(page)
    events = events[(page-1)*int(params['no_of_events']):(page-1)*int(params['no_of_events'])+int(params['no_of_events'])]
    if(page==1):
        prev="#"
        next="/?page="+str(page+1)
    elif(page==last):
        prev="/?page="+str(page-1)
        next="#"
    else:
        prev="/?page="+str(page-1)
        next="/?page="+str(page+1)
    return render_template('index.html', params=params, events=events, prev=prev, next=next)


@app.route("/event/<string:event_slug>", methods=['GET'])
def event_route(event_slug):
    event = Events.query.filter_by(slug=event_slug).first()
    volunteers = Volunteers.query.filter_by(EventNumber=event.EventNumber)
    return render_template('event.html', params=params, event=event, volunteers=volunteers)

@app.route("/about")
def about():
    return render_template('about.html', params=params)

@app.route("/author")
def author():
    return render_template('author.html')


@app.route("/dashboard", methods=['GET','POST'])
def dashboard():
    if('user' in session and session['user'] == params['admin_user']):
        events = Events.query.all()
        return render_template('dashboard.html', params=params, events=events)

    if request.method=='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == params['admin_user'] and userpass == params['admin_password']):
            session['user']=username
            events = Events.query.all()
            return render_template('dashboard.html', params=params, events=events)

    return render_template('login.html',params=params)

@app.route("/display-feedbacks")
def display_feedbacks():
    if('user' in session and session['user'] == params['admin_user']):
        feedbacks = Feedbacks.query.all()
        return render_template('display-feedbacks.html', params=params, feedbacks=feedbacks)

@app.route("/edit/<string:sno>",methods = ['GET','POST'])
def edit(sno):
    if('user' in session and session['user'] == params['admin_user']):
        if request.method=='POST':
            EventName = request.form.get('EventName')
            Tagline = request.form.get('Tagline')
            slug = request.form.get('slug')
            Description = request.form.get('Description')
            EventNumber = request.form.get('EventNumber')
            EventDate = request.form.get('EventDate')
            if(sno=='0'):
                event = Events(EventName=EventName,EventDate=EventDate,Tagline=Tagline,Description=Description,EventNumber=EventNumber,slug=slug)
                db.session.add(event)
                db.session.commit()
            else:
                event = Events.query.filter_by(SerialNumber=sno).first()
                event.EventName = EventName
                event.slug = slug
                event.Description = Description
                event.Tagline = Tagline
                event.EventNumber = EventNumber
                event.EventDate = EventDate
                db.session.commit()
                return redirect('/edit/'+sno)
        event = Events.query.filter_by(SerialNumber=sno).first()
        return render_template('edit.html',params=params, sno=sno, event=event)


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<string:sno>",methods = ['GET','POST'])
def delete(sno):
    if('user' in session and session['user'] == params['admin_user']):
        event = Events.query.filter_by(SerialNumber=sno).first()
        db.session.delete(event)
        db.session.commit()
    return redirect('/dashboard')

@app.route("/register", methods = ['GET', 'POST'])
def register():
    events = Events.query.filter_by().all()
    if(request.method=='POST'):
        Name = request.form.get('Name')
        Age = request.form.get('Age')
        Event = request.form.get('Event')
        EventNumber = request.form.get('EventNumber')
        Duty = request.form.get('Duty')
        # RegistrationDate = request.form.get('RegistrationDate')
        PhoneNumber = request.form.get('PhoneNumber')
        entry = Volunteers(Name=Name, Age = Age, Event=Event, EventNumber=EventNumber, Duty=Duty, RegistrationDate=datetime.now() , PhoneNumber=PhoneNumber)
        db.session.add(entry)
        db.session.commit()
    return render_template('register.html', params=params, events=events)

@app.route("/feedback", methods = ['GET', 'POST'])
def feedback():
    if(request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        feedback = request.form.get('feedback')
        entry = Feedbacks(Name=name, Email = email, Feedback = feedback, Date= datetime.now() )
        db.session.add(entry)
        db.session.commit()
    return render_template('feedback.html', params=params)

if __name__ == "__main__":
    app.run(debug=True)
