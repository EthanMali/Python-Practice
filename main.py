import PySimpleGUI as sg
from time import time
from random import randint
import uuid
from sys import exit



def convert_pos_to_pixel(cell):
    tl = cell[0] * CELL_SIZE, cell[1] * CELL_SIZE
    br = tl[0] + CELL_SIZE, tl[1] + CELL_SIZE
    return tl, br

def place_apple():
    apple_pos = randint(0, CELL_NUM - 1), randint(0, CELL_NUM - 1)
    while apple_pos in snake_body:
        apple_pos = randint(0, CELL_NUM - 1), randint(0, CELL_NUM - 1)
    return apple_pos

def initialize_game():
    global snake_body, direction, apple_pos, apple_eaten, start_time
    snake_body = [(4, 4), (3, 4), (2, 4)]
    direction = DIRECTIONS['up']
    apple_pos = place_apple()
    apple_eaten = False
    start_time = time()

# Game constants
FIELD_SIZE = 400
CELL_NUM = 12
CELL_SIZE = FIELD_SIZE / CELL_NUM
move_interval = 0.3
icon_path = 'snake.ico'

DIRECTIONS = {'left': (-1, 0), 'right': (1, 0), 'up': (0, 1), 'down': (0, -1)}

sg.theme('Green')
field = sg.Graph(
    canvas_size=(FIELD_SIZE, FIELD_SIZE),
    graph_bottom_left=(0, 0),
    graph_top_right=(FIELD_SIZE, FIELD_SIZE),
    background_color='black'
)
layout = [[field]]
window = sg.Window('Snake', layout, return_keyboard_events=True, resizable=True, finalize=True, icon=icon_path)

# Track initial window size
window_size = window.size

while True:
    initialize_game()
    game_over = False
    while not game_over:
        event, values = window.read(timeout=10)
        if event == sg.WIN_CLOSED:
            break
        if event == 'Left:37': direction = DIRECTIONS['left']
        if event == 'Up:38': direction = DIRECTIONS['up']
        if event == 'Right:39': direction = DIRECTIONS['right']
        if event == 'Down:40': direction = DIRECTIONS['down']

        # Check for window resize
        new_size = window.size
        if new_size != window_size:
            window_size = new_size
            FIELD_SIZE = min(new_size)
            CELL_SIZE = FIELD_SIZE / CELL_NUM
            field.change_coordinates((0, 0), (FIELD_SIZE, FIELD_SIZE))

            # Redraw the game elements after resizing
            field.erase()
            field.DrawRectangle((0, 0), (FIELD_SIZE, FIELD_SIZE), 'black')
            tl, br = convert_pos_to_pixel(apple_pos)
            field.DrawRectangle(tl, br, 'red')
            for index, part in enumerate(snake_body):
                tl, br = convert_pos_to_pixel(part)
                color = 'yellow' if index == 0 else 'green'
                field.DrawRectangle(tl, br, color)

        time_since_start = time() - start_time
        if time_since_start >= move_interval:
            start_time = time()

            # Apple snake collision
            if snake_body[0] == apple_pos:
                apple_pos = place_apple()
                apple_eaten = True
                move_interval -= 0.001

            # Snake update
            new_head = (snake_body[0][0] + direction[0], snake_body[0][1] + direction[1])
            snake_body.insert(0, new_head)
            if not apple_eaten:
                snake_body.pop()
            apple_eaten = False

            # Check death
            if not 0 <= snake_body[0][0] <= CELL_NUM - 1 or \
               not 0 <= snake_body[0][1] <= CELL_NUM - 1 or \
               snake_body[0] in snake_body[1:]:
                if sg.popup('Game Over!', 'You died. Do you want to continue?', custom_text=('Continue', 'Exit')) == 'Exit':
                    window.close()
                    exit()
                else:
                    game_over = True

            field.DrawRectangle((0, 0), (FIELD_SIZE, FIELD_SIZE), 'black')

            tl, br = convert_pos_to_pixel(apple_pos)
            field.DrawRectangle(tl, br, 'red')
            # Draw snake
            for index, part in enumerate(snake_body):
                tl, br = convert_pos_to_pixel(part)
                color = 'yellow' if index == 0 else 'green'
                field.DrawRectangle(tl, br, color)

    if event == sg.WIN_CLOSED:
        break

window.close()
