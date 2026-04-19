class ReferenceController < ApplicationController
  before_action :set_topic, only: [ :show ]

  def index
    @topics = Topic.all
  end

  def show
    @theory = theory_content(@topic.title)
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def theory_content(topic_title)
    case topic_title
    when "Производные"
      <<~HTML
        <h2></h2>

        <details>
          <summary><strong>Базовые производные</strong></summary>
          <ul>
            <li>(x)' = 1</li>
            <li>(x²)' = 2x</li>
            <li>(x³)' = 3x²</li>
            <li>(sin x)' = cos x</li>
            <li>(cos x)' = -sin x</li>
            <li>(e^x)' = e^x</li>
            <li>(ln x)' = 1/x</li>
          </ul>
        </details>

        <details>
          <summary><strong>Правила дифференцирования</strong></summary>
          <ul>
            <li>(f + g)' = f' + g'</li>
            <li>(f · g)' = f'g + fg'</li>
            <li>(f / g)' = (f'g - fg') / g²</li>
            <li>(f(g(x)))' = f'(g(x)) · g'(x)</li>
          </ul>
        </details>

        <details>
          <summary><strong>Примеры</strong></summary>
          <ul>
            <li>(x² + 3x)' = 2x + 3</li>
            <li>(sin x + x³)' = cos x + 3x²</li>
          </ul>
        </details>
      HTML

    when "Интегралы"
      <<~HTML
        <h2></h2>

        <details>
          <summary><strong>Базовые интегралы</strong></summary>
          <ul>
            <li>∫xⁿ dx = xⁿ⁺¹ / (n+1) + C</li>
            <li>∫1/x dx = ln|x| + C</li>
            <li>∫e^x dx = e^x + C</li>
            <li>∫sin x dx = -cos x + C</li>
            <li>∫cos x dx = sin x + C</li>
          </ul>
        </details>

        <details>
          <summary><strong>Свойства</strong></summary>
          <ul>
            <li>∫(f + g) dx = ∫f dx + ∫g dx</li>
            <li>∫k·f dx = k∫f dx</li>
          </ul>
        </details>

        <details>
          <summary><strong>Примеры</strong></summary>
          <ul>
            <li>∫(x² + 3x) dx = x³/3 + 3x²/2 + C</li>
          </ul>
        </details>
      HTML

    when "Пределы"
      <<~HTML
        <h2></h2>

        <details>
          <summary><strong>Основные пределы</strong></summary>
          <ul>
            <li>lim (sin x)/x = 1 при x → 0</li>
            <li>lim (1 + 1/n)^n = e при n → ∞</li>
            <li>lim (e^x - 1)/x = 1 при x → 0</li>
          </ul>
        </details>

        <details>
          <summary><strong>Свойства пределов</strong></summary>
          <ul>
            <li>lim(f + g) = lim f + lim g</li>
            <li>lim(f · g) = lim f · lim g</li>
            <li>lim(f / g) = lim f / lim g</li>
          </ul>
        </details>

        <details>
          <summary><strong>Примеры</strong></summary>
          <ul>
            <li>lim (x² + 3x), x → 2 = 10</li>
          </ul>
        </details>
      HTML

    when "Матрицы"
      <<~HTML
        <h2></h2>

        <details>
          <summary><strong>Основные операции</strong></summary>
          <ul>
            <li>Сложение матриц: A + B</li>
            <li>Умножение матрицы на число: kA</li>
            <li>Умножение матриц: AB</li>
          </ul>
        </details>

        <details>
          <summary><strong>Определитель матрицы</strong></summary>
          <ul>
            <li>Для матрицы 2×2: det(A) = ad - bc</li>
          </ul>
        </details>

        <details>
          <summary><strong>Обратная матрица</strong></summary>
          <ul>
            <li>A⁻¹ = (1 / det(A)) · adj(A)</li>
          </ul>
        </details>

        <details>
          <summary><strong>Пример</strong></summary>
          <ul>
            <li>A = |1 2| |3 4|</li>
            <li>det(A) = 1·4 - 2·3 = -2</li>
          </ul>
        </details>
      HTML

    else
      "<h2>Материал пока не добавлен</h2>"
    end
  end
end
