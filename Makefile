# デフォルトのターゲット
.PHONY: all
all: brew dotfiles

# Homebrewのインストール（既にインストールされている場合はスキップ）
.PHONY: install_homebrew
install_homebrew:
	@if command -v brew >/dev/null 2>&1; then \
		echo "Homebrewは既にインストールされています。スキップします。"; \
	else \
		echo "Homebrewをインストールしています..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
		echo "Homebrewのインストールが完了しました。"; \
	fi

# Brewfileからパッケージをインストール
.PHONY: brew
brew: install_homebrew
	@echo "Brewfileからパッケージをインストールしています..."
	@if [ ! -f Brewfile ]; then \
		echo "Brewfileが見つかりません。カレントディレクトリにBrewfileを配置してください。"; \
		exit 1; \
	fi
	@brew bundle
	@echo "パッケージのインストールが完了しました。"

.PHONY: dotfiles
dotfiles:
	@cd ../ && git clone https://github.com/koh-sh/dotfiles.git || (cd dotfiles && git pull)
	@cd ../dotfiles && ./setup.sh
