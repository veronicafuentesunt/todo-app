# To Do App
(React Native + Flask)
Overview
A simple cross platform to do list app built with React Native (frontend) and Flask (backend).
This project demonstrates a clean full stack setup and serves as a foundation for experimenting with UX, ethical design, and future enhancements.

Features
•	Add, view, and toggle tasks
•	RESTful API with Flask
•	Cross platform mobile UI with React Native
•	In memory storage (easy to extend with a database later)
•	Modular structure for future personalization

Tech Stack
•	Frontend: React Native, Axios
•	Backend: Python, Flask, Flask CORS
•	Version Control: Git + GitHub

Project Structure
/backend
   app.py
   requirements.txt
/frontend
   App.js
   package.json

Getting Started
1. Clone the repo
git clone https://github.com/veronicafuentesunt/todo-app.git
cd todo-app
2. Backend Setup
cd backend
python -m venv venv
source venv/bin/activate   # or venv\Scripts\activate on Windows
pip install -r requirements.txt
python app.py
Backend runs at: http://127.0.0.1:5000
3. Frontend Setup
cd frontend
npm install
npx react-native run-android   # or run-ios

Future Enhancements
•	Categories/tags for tasks
•	Due dates and reminders
•	Persistent database (SQLite/PostgreSQL)
•	Authentication for multiple users
•	UI polish with custom themes

Screenshots
Coming soon

Author
Veronica Fuentes
•	Portfolio: https://github.com/veronicafuentesunt/portfolio
•	LinkedIn: veronica-fuentes-python-pro
•	Email: veronica.elsa1021@gmail.com

License
This project is licensed under the MIT License — see the LICENSE file for details.

