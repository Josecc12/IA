import random

# Define el tablero de juego
board = [' ' for _ in range(9)]

# Define la función para imprimir el tablero
def print_board():
    row1 = '|'.join(board[0:3])
    row2 = '|'.join(board[3:6])
    row3 = '|'.join(board[6:9])
    print(row1)
    print('-----')
    print(row2)
    print('-----')
    print(row3)

# Define la función para verificar si alguien ganó
def check_win(player):
    # Revisa las filas
    for i in range(0, 9, 3):
        if board[i:i+3] == [player]*3:
            return True
    # Revisa las columnas
    for i in range(3):
        if board[i::3] == [player]*3:
            return True
    # Revisa las diagonales
    if board[0] == player and board[4] == player and board[8] == player:
        return True
    if board[2] == player and board[4] == player and board[6] == player:
        return True
    return False

# Define la función para hacer un movimiento
def make_move(player):
    # Si el jugador es la computadora, elegir un movimiento aleatorio
    if player == 'O':
        move = random.randint(0, 8)
    # Si el jugador es humano, pedir que elija una casilla
    else:
        move = int(input("Ingrese una posición (1-9): ")) - 1
    # Verificar que la casilla esté libre y hacer el movimiento
    if board[move] == ' ':
        board[move] = player
    else:
        print("Casilla ocupada. Elija otra.")
        make_move(player)

# Jugar hasta que alguien gane
while True:
    # Imprimir el tablero
    print_board()
    # Hacer un movimiento para el jugador X
    make_move('X')
    # Revisar si alguien ganó
    if check_win('X'):
        print_board()
        print("¡Jugador X ha ganado!")
        break
    # Imprimir el tablero
    print_board()
    # Hacer un movimiento para la computadora (jugador O)
    make_move('O')
    # Revisar si alguien ganó
    if check_win('O'):
        print_board()
        print("¡Jugador O ha ganado!")
        break
