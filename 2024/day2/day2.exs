defmodule Day02 do
  def increasing_adj?(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a < b and abs(a - b) >= 1 and abs(a - b) <= 3 end)
  end

  def decreasing_adj?(list) do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a > b and abs(a - b) >= 1 and abs(a - b) <= 3 end)
  end

  # run case statement that parses the list
  def part1(input) do
    all = parse(input)

    result =
      Enum.map(all, fn list ->
        cond do
          decreasing_adj?(list) or increasing_adj?(list) ->
            "SAFE"

          true ->
            "NOT SAFE"
        end
      end)

    count = Enum.count(result, &(&1 == "SAFE"))
    count
  end

  defp parse(input) do
    input
    |> Enum.map(fn line ->
      String.split(line)
      |> Enum.map(&String.to_integer/1)
    end)
  end
end

Day02.part1(File.stream!("day2.input", :line))
|> IO.inspect()
