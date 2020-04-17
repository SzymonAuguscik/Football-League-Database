from random import randint, shuffle


def main():
    gamesID = [1, 9, 17, 25, 33, 41, 49, 57, 65, 73, 81, 89, 97, 105, 113, 121, 129, 137, 145, 153, 161, 169, 177, 185,
               193, 201, 209, 217, 225, 233]

    goalkeepers, defenders, midfielders, strikers = setPlayers()

    goalCount = [2, 0, 0, 2, 1, 2, 1, 1, 5, 0, 1, 3, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 0, 1, 3, 5, 0, 2, 0, 3]
    cleanSheet = [7, 9, 29]
    assistCount = goalCount.copy()
    cards = ["'{\"yellow\"}'" for i in range(45)] + ["'{\"red\"}'", "'{\"yellow\",\"yellow\",\"red\"}'", "'{\"yellow\",\"red\"}'"]
    file = open("aim.txt", "w+")

    for i in range(len(gamesID)):
        punished = randint(0, 8)
        count = randint(11, 14)
        clean = "FALSE"
        if len(cleanSheet) != 0 and i+1 == cleanSheet[0]:
            clean = "TRUE"
            cleanSheet.pop(0)

        goals = makeEventArray(count, goalCount, i)
        assists = makeEventArray(count, assistCount, i)
        cardList = initializeCards(count, punished, cards)

        file.write("--" + str(i+1) + ". match--\n")
        for j in range(count):
            if j == 0:
                playerID, goalkeepers = randomize(goalkeepers)
            elif 0 < j < 5:
                playerID, defenders = randomize(defenders)
            elif 4 < j < 10 or j > 11:
                playerID, midfielders = randomize(midfielders)
            else:
                playerID, strikers = randomize(strikers)
                if j == 11:
                    file.write("--subs--\n")
            goal = "NULL"
            assist = "NULL"
            if j != 0:
                clean = "FALSE"
                if goals[j-1]:
                    goal = goals[j-1]
                if assists[j-1]:
                    assist = assists[j-1]

            m_goal = "NULL"
            m_assist = "NULL"
            m_card = "NULL"

            if goal != "NULL":
                m_goal = "'{}'"
            if assist != "NULL":
                m_assist = "'{}'"
            if cardList[j] != "NULL":
                m_card = "'{}'"

            file.write("INSERT INTO gamesPlayed VALUES('FKB',"+str(playerID)+","+str(gamesID[i])+",90,"+str(goal)+","+str(assist)+","+cardList[j]+","+clean+","+m_goal+","+m_assist+","+m_card+");\n")
        goalkeepers, defenders, midfielders, strikers = setPlayers()
    file.close()


def setPlayers():
    arr1 = [1 for i in range(20)] + [12 for i in range(3)] + [31 for i in range(1)]

    arr2 = [2 for i in range(19)] + [4 for i in range(17)] + [19 for i in range(19)] + [6 for i in range(18)] + \
                [20 for i in range(17)] + [21 for i in range(5)] + [23 for i in range(6)] + [25 for i in range(3)] + \
                [45 for i in range(3)]

    arr3 = [7 for i in range(19)] + [10 for i in range(21)] + [11 for i in range(18)] + [22 for i in range(18)] + \
                  [29 for i in range(12)] + [24 for i in range(11)] + [27 for i in range(10)] + [77 for i in range(5)] + \
                  [77 for i in range(3)]

    arr4 = [9 for i in range(20)] + [17 for i in range(12)] + [37 for i in range(10)] + [93 for i in range(3)]

    return arr1, arr2, arr3, arr4


def initializeCards(count, punished, cards):
    cardList = []
    for t in range(punished):
        cardList.append(cards[randint(0, len(cards)-1)])

    for t in range(len(cardList), count):
        cardList.append("NULL")
    shuffle(cardList)

    return cardList


def randomize(array):
    s = array[randint(0, len(array)-1)]
    return s, [value for value in array if value != s]


def makeEventArray(count, eventCount, index):
    events = []
    for t in range(count - 1):
        multigoal = []
        multi = 1
        for z in reversed(range(eventCount[index])):
            for y in range(multi):
                multigoal.append(z + 1)
            multi += 10
        tmp = 0
        if len(multigoal):
            tmp = multigoal[randint(0, len(multigoal) - 1)]
        if eventCount[index]:
            events.append(tmp)
        else:
            events.append(0)
        eventCount[index] -= tmp
        if eventCount[index] < 0:
            eventCount[index] = 0
    shuffle(events)
    return events


if __name__ == "__main__":
    main()
