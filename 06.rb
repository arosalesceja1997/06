# frozen_string_literal: true

class GameLive
  def initialize
    @longitud = 10
    @matrix = Array.new(10) { Array.new(10) { 0 } }
  end

  def llenar_game_random
    (0...10).each do |i|
      (0...10).each do |j|
        @matrix[i][j] = rand(2)
      end
    end
  end

  def juego_dibujar
    @matrix.each do |column|
      column.each do |card|
        print card
        print ' ' # print no imprime un salto de linea al final del output
      end
      puts ' ' # salto de linea
    end
  end

  def llenado_manual(x, y)
    @matrix[x][y] = 1
  end

  def jugando_game
    tem_matrix = Array.new(10) { Array.new(10) { 0 } }
    (0...10).each do |i|
      (0...10).each do |j|
        tem_matrix[i][j] = (@matrix[i][j]).zero ? juego_reglas(i, j, false) : juego_reglas(i, j, true)
      end
    end
    @matrix = temMatrix
  end

  def juego_reglas(x, x, es_viva)
    @celulas_vivas = 0
    part1(x, y)
    part2(x, y)
    part3(x, y)
    part4(x, y)
    retorno(es_viva)
    return @resul
  end

  def part1(x, y)
    if x >= 1 && y >= 1
      @matrix[x - 1][y - 1] == 1 ? @celulas_vivas += 1 : ''
    end
    if y >= 1
      @matrix[x][y - 1] == 1 ? @celulas_vivas += 1 : ''
    end
  end

  def part2(x, y)
    if x < @longitud - 1 && y >= 1
      @matrix[x + 1][y - 1] == 1 ? @celulas_vivas += 1 : ''
    end
    if x >= 1
      @matrix[x - 1][y] == 1 ? @celulas_vivas += 1 : ''
    end
  end

  def part3(x, y)
    if x < @longitud - 1
      @matrix[x + 1][y] == 1 ? @celulas_vivas += 1 : ''
    end
    if x >= 1 && y < @longitud - 1
      @matrix[x - 1][y + 1] == 1 ? @celulas_vivas += 1 : ''
    end
  end

  def part4(x, y)
    if y < @longitud - 1
      @matrix[x][y + 1] == 1 ? @celulas_vivas += 1 : ''
    end
    if x < @longitud - 1 && y < @longitud - 1
      @matrix[x + 1][y + 1] == 1 ? @celulas_vivas += 1 : ''
    end
  end

  def retorno(es_viva)
    @resul = if es_viva
               (@celulas_vivas == 2 || @celulas_vivas == 3 ? 1 : 0)
             else
               (@celulas_vivas == 3 ? 1 : 0)
             end
  end
end

# require 'minitest/autorun'
# class GamecaseTest < Minitest::Test
#   def initialize; end

#   def test_game_live
#     testObject = GameLive.new

#     testObject.llenadoManual(3, 1)
#     testObject.llenadoManual(3, 2)
#     testObject.llenadoManual(3, 3)
#     testObject.juegoDibujar

#     (0..0).each do |_i|
#       res = testObject.jugandoGame
#       puts
#       testObject.juegoDibujar
#     end

#     testMatrix = Array.new(10) { Array.new(10) { 0 } }
#     testMatrix[2][2] = 1
#     testMatrix[2][1] = 1
#     testMatrix[2][3] = 1

#     assert_equal res, testMatrix
#     # assert_equal[]
#   end
# end

# x = GamecaseTest.new
# x.test_game_live
