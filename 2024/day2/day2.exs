defmodule Day02 do
  def part1(input) do
  end

  # def part2(input) do
  # end

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

# Day02.part1(File.stream!("", :line))
# |> IO.inspect()
