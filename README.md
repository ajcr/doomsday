# doomsday

A collection of methods to compute the day of the week from a given date in the Gregorian calendar.

## Usage

To run the scripts you must have a J interpreter installed (the scripts look for `/usr/bin/ijconsole` so adjust this as necessary).

Clone this repository (or download any of scripts you want). Make sure the scripts are execuatable (i.e. `chmod +x [script]`).

Then pass the date as arguments of the form `YYYY MM DD`. For example:

```
$ ./doomsday.ijs 1999 12 31
Friday

$ ./zeller.ijs 2080 2 29    
Thursday
```
