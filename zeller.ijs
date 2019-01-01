#!/usr/bin/ijconsole

NB. Compute the day of the week from a given date using Zeller's Congurence
NB. Usage: ./zeller.ijs YYYY MM DD
NB. Reference: https://en.wikipedia.org/wiki/Zeller%27s_congruence

DAYS =: 'Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday',:'Friday'

truncdiv =: [: (* * <.@:|) %

integers =: 0".>,.2}.ARGV

year =: 0 { 0 { integers
month =: 0 { 1 { integers
day =: 0 { 2 { integers

NB. January and Frebruary are considered months 13 and 14 of the previous year
year =: year - month < 3
month =: (+ 12&*@:<&3) month

NB. offset for month endings (modulo 7) starting in March is 3, 2, 3, 2, 3, 3, 2, 3, 2, 3, 3, 0/1
NB. multiplying the month by 13/5 and truncating gives a sequence with this periodicity
monthEndOffset =: 5 truncdiv~ 13 * 1 + month

NB. year offset to account for leap years
NB. this means each block of four years (starting from a leap year) will have the same offset (modulo 7)
NB. the offset is incremented at each new leap year
yearEndOffset =: +/ year truncdiv 4 _100 400

NB. the sum of the day, year and offsets modulo 7 gives the day of the week
echo DAYS {~ 7 | day + monthEndOffset + year + yearEndOffset

exit''
