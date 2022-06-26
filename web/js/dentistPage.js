/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

///format date

const formatDate = (xx) => {
  const d = new Date(xx);
  let mm = d.getMonth() + 1; // Months start at 0!
  let dd = d.getDate();
  if (dd < 10) dd = "0" + dd;
  if (mm < 10) mm = "0" + mm;
  return (m = [dd, mm, d.getFullYear()].join("/"));
};

//// get date and update timetable
var dayOfWeek = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
];
var day = new Date();
var tmp = (tpm = day.getTime());
var d = day.getDay();
var listDay = [];
listDay[d] = formatDate(day);
for (let i = 1; i < d; i++) {
  tmp = tmp - 1000 * 60 * 60 * 24;
  listDay[new Date(tmp).getDay()] = formatDate(new Date(tmp));
}
for (let i = d; i < 7; i++) {
  tpm = tpm + 1000 * 60 * 60 * 24;
  listDay[new Date(tpm).getDay()] = formatDate(new Date(tpm));
}
console.log(formatDate(new Date(tpm)));

//get <tr> to print data
var trDay = document.getElementById("day");
const collection = trDay.children;
for (let i = 1; i < 7; i++) {
  collection[i].innerHTML = listDay[i];
}
collection[7].innerHTML = listDay[0];


/// Bác sĩ đăng kí lịch đặt

for (let i = 1; i < 8; i++) {
  for (let k = 1; k < 5; k++) {
    var slot = document.getElementsByClassName(`ngay${i} slot${k}`);
    slot[0].classList.add("register");
    slot[0].innerHTML = "Đăng ký";
  }
}

