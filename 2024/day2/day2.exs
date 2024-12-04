defmodule Day02 do
  # run case statement that parses the list
  def part1(input) do
    all = parse(input)
    all
  end

  # def part2(input) do
  # end

  defp parse(input) do
    input
    |> Enum.map(fn line ->
      String.split(line)
      |> Enum.map(&String.to_integer/1)
    end)
  end
end

Day02.part1(File.stream!("day2.test", :line))
|> IO.inspect()
