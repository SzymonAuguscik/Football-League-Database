import random as rand

scores = [0 for i in range(9)] + [1 for i in range(13)] + [2 for i in range(12)] + [3 for i in range(7)] + \
         [4 for i in range(4)] + [5 for i in range(2)] + [6 for i in range(1)]
teams = ['FCW', 'PIE', 'RIV', 'RAI', 'VOI', 'SCH', 'LEP', 'PRE', 'DRA', 'FKK', 'NIE', 'SVE', 'ACH', 'HAD', 'KRE', 'FKB']


def main():
    table = [[16, 1, 2, 15, 3, 14, 4, 13, 5, 12, 6, 11, 7, 10, 8, 9],
             [9, 16, 10, 8, 11, 7, 12, 6, 13, 5, 14, 4, 15, 3, 1, 2],
             [16, 2, 3, 1, 4, 15, 5, 14, 6, 13, 7, 12, 8, 11, 9, 10],
             [10, 16, 11, 9, 12, 8, 13, 7, 14, 6, 15, 5, 1, 4, 2, 3],
             [16, 3, 4, 2, 5, 1, 6, 15, 7, 14, 8, 13, 9, 12, 10, 11],
             [11, 16, 12, 10, 13, 9, 14, 8, 15, 7, 1, 6, 2, 5, 3, 4],
             [16, 4, 5, 3, 6, 2, 7, 1, 8, 15, 9, 14, 10, 13, 11, 12],
             [16, 12, 13, 11, 14, 10, 15, 9, 1, 8, 2, 7, 3, 6, 4, 5],
             [5, 16, 6, 4, 7, 3, 8, 2, 9, 1, 10, 15, 11, 14, 12, 13],
             [16, 13, 14, 12, 15, 11, 1, 10, 2, 9, 3, 8, 4, 7, 5, 6],
             [6, 16, 7, 5, 8, 4, 9, 3, 10, 2, 11, 1, 12, 15, 13, 14],
             [16, 14, 15, 13, 1, 12, 2, 11, 3, 10, 4, 9, 5, 8, 6, 7],
             [7, 16, 8, 6, 9, 5, 10, 4, 11, 3, 12, 2, 13, 1, 14, 15],
             [16, 15, 1, 14, 2, 13, 3, 12, 4, 11, 5, 10, 6, 9, 7, 8],
             [8, 16, 9, 7, 10, 6, 11, 5, 12, 4, 13, 3, 14, 2, 15, 1]
             ]

    mapMultilist(table)

    file = open("target.txt", "w+")
    count = 1

    startingDay = "'01-07-2018'"

    for i in range(len(table)):
        for j in range(0, len(table[i]), 2):
            date = ""
            if j < 3:
                date = setWeekend(startingDay)[0]
            elif 3 < j < 7:
                date = setWeekend(startingDay)[1]
            elif 7 < j < 11:
                date = setWeekend(startingDay)[2]
            elif 11 < j < 15:
                date = setWeekend(startingDay)[3]

            file.write("INSERT INTO games VALUES("+str(count)+",'"+teams[table[i][j]]+"','"+teams[table[i][j+1]]+"','{"+str(randomScore(scores))+","+str(randomScore(scores))+"}',"+date+");\n")
            count += 1
        startingDay = dateUpdate(startingDay, 7)

    startingDay = "'01-03-2018'"

    for i in range(len(table)):
        for j in range(0, len(table[i]), 2):
            date = ""
            if j < 3:
                date = setWeekend(startingDay)[0]
            elif 3 < j < 7:
                date = setWeekend(startingDay)[1]
            elif 7 < j < 11:
                date = setWeekend(startingDay)[2]
            elif 11 < j < 15:
                date = setWeekend(startingDay)[3]

            file.write("INSERT INTO games VALUES(" + str(count) + ",'" + teams[table[i][j+1]] + "','" + teams[table[i][j]] + "','{" + str(randomScore(scores)) + "," + str(randomScore(scores)) + "}'," + date + ");\n")
            count += 1
        startingDay = dateUpdate(startingDay, 7)


def randomScore(score):
    return score[rand.randint(0, len(score)-1)]


def mapMultilist(multi):
    for i in range(len(multi)):
        for j in range(len(multi[i])):
            multi[i][j] -= 1


def setWeekend(date):
    return [date, dateUpdate(date, 1), dateUpdate(date, 2), dateUpdate(date, 3)]


def setMax(num):
    maxi = 0
    if 0 < num < 8:
        if num % 2 == 1:
            maxi = 31
        elif num == 2:
            maxi = 28
        else:
            maxi = 30
    elif 7 < num < 13:
        if num % 2 == 1:
            maxi = 30
        else:
            maxi = 31
    return maxi


def dateUpdate(date, days):
    day = int(date[1:3]) + days
    month = int(date[4:6])
    year = int(date[7:11])

    maxDay = setMax(month)
    maxMonth = 12

    if day > maxDay:
        day = day - maxDay
        month += 1

    if month > maxMonth:
        month = 1
        year += 1

    s = "'"

    if day // 10 == 0:
        s += "0"

    s += str(day) + "-"

    if month // 10 == 0:
        s += "0"

    s += str(month) + "-" + str(year) + "'"

    return s


if __name__ == "__main__":
    main()
