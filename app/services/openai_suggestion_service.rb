class OpenaiSuggestionService
  def initialize(adults:, children:, children_ages:,interests:, budget:, area:, weather:)
    @adults = adults.presence || "未指定"
    @children = children.presence || "未指定"
    @children_ages = children_ages&.join(", ") || "未指定"
    @interests = interests&.join(", ") || "指定なし"
    @budget = budget.presence || "未指定"
    @area = area.presence || "指定なし"
    @weather = weather.presence || "未指定"
  end

  def call
    client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"].strip)

    prompt = <<~PROMPT
      家族構成: 大人 #{@adults}人、子ども #{@children}人
      興味: #{@interests}
      予算: #{@budget}
      現在地からの距離: #{@max_distance} km以内
      天気: #{@weather}

      この条件に合った休日の遊びアイデアを**必ず3つだけ**提案してください。
  
      
    PROMPT

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt }],
        temperature: 0.7,
        max_tokens: 512
      }
    )

    response.dig("choices", 0, "message", "content")
  rescue OpenAI::Error => e
    Rails.logger.error("OpenAI API Error: #{e.message}")
    "提案を取得できませんでした。"
  end
end
