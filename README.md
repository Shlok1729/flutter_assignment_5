# 💪 BMI Calculator - Flutter App

An interactive and visually engaging Body Mass Index (BMI) calculator made with Flutter.  
It calculates BMI in real-time using sliders and provides instant visual and emoji feedback based on the result.

---

## 📐 BMI Logic Used

> **BMI = weight (kg) / (height (m))²**

The app converts height from cm to meters, then calculates BMI dynamically as sliders are moved.

Example:

---

## 🧠 BMI Categories

| BMI Range      | Category     | Emoji  |
|----------------|--------------|--------|
| < 18.5         | Underweight  | 😟     |
| 18.5 – 24.9    | Normal       | 😊     |
| 25.0 – 29.9    | Overweight   | 😅     |
| 30.0 and above | Obese        | 😨     |

---

## ✨ Features

- 🎚️ Sliders for adjusting height (cm) and weight (kg)
- 🔢 Real-time BMI updates
- 🎨 Dynamic gradient background based on BMI category
- 😎 Emoji reactions for each BMI level
- 🧽 Reset button to restore defaults
- ⚡ Smooth animations using `AnimatedContainer`
- 🧱 Built 100% using core Flutter widgets

---

## 📸 Screenshots

<img width="1919" height="970" alt="Image" src="https://github.com/user-attachments/assets/c03b2662-2f9e-4a5b-9e02-1f18674322a6" />
<img width="1919" height="983" alt="Image" src="https://github.com/user-attachments/assets/a1985d98-a1df-4eab-846d-945c1ea66704" />

---

## 🚀 Getting Started

### 1. Clone this repo:
```bash
git clone https://github.com/yourusername/flutter-bmi-calculator.git
cd flutter-bmi-calculator
