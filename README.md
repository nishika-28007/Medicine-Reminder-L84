# Medicine Reminder System

## Project Information
- **Project ID:** L84
- **Subject:** OS Linux Lab
- **Project:** Medicine Reminder System
- **Language:** Bash Shell Scripting
- **Platform:** Linux

## Project Description
Medicine Reminder System is a shell scripting project that helps users manage their medicine schedules, check upcoming doses, update medicine stock, and maintain a taken medicine log.

## Features
1. View all medicines.
2. View today's medicine schedule in time order.
3. Check the next medicine dose.
4. Mark a medicine as taken and reduce its stock.
5. Display low-stock medicines (below 5).
6. View the taken medicine log.
7. Create a compressed project backup.
8. Run an hourly reminder using cron.

## Project Structure
- `main.sh` – Main menu and program.
- `lib/functions.sh` – Reusable shell functions.
- `data/meds.csv` – Medicine details and stock.
- `logs/taken.log` – Taken medicine history.
- `logs/reminders.txt` – Reminder check history.
- `backup/` – Compressed project backup.
- `reports/` – Project reports.

## How to Run

```bash
cd ~/MedicineReminder
chmod +x main.sh
./main.sh
```

## Technologies Used
- Linux
- Bash Shell Scripting
- AWK
- SED
- Cron
- TAR

## Project Guide
This project was completed under the guidance of  
**Dr. Anjum Y. Mansuri**, Assistant Professor, Computer Applications,  
LJ Institute of Computer Applications, LJ University, Ahmedabad.

GitHub: [@anjum-mansuri](https://github.com/anjum-mansuri)

**OS Linux Lab 260120510 | Project ID: L84**
