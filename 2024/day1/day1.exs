defmodule Day01 do
  def part1(input) do
    all = parse(input)
    {first, second} = Enum.unzip(all)

    Enum.zip(Enum.sort(first), Enum.sort(second))
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
  end

  def part2(input) do
    all = parse(input)
    {first, second} = Enum.unzip(all)
    freq = Enum.frequencies(second)

    first
    |> Enum.reduce(0, fn value, acc ->
      v = Map.get(freq, value, 0)
      acc + value * v
    end)
  end

  defp parse(input) do
    input
    |> Enum.map(fn line ->
      {first, line} = Integer.parse(line)
      line = String.trim(line)
      {second, ""} = Integer.parse(line)
      {first, second}
    end)
  end
end

# Day01.part1(File.stream!("day1.input", :line))
# |> IO.inspect()
#
# Day01.part2(File.stream!("day1.input", :line))
# |> IO.inspect()
