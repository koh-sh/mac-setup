# デフォルトのターゲット
.PHONY: all
all: brew dotfiles mise

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
	@/opt/homebrew/bin/brew bundle
	@echo "パッケージのインストールが完了しました。"

.PHONY: dotfiles
dotfiles:
	@cd ../ && git clone https://github.com/koh-sh/dotfiles.git || (cd dotfiles && git pull)
	@cd ../dotfiles && ./setup.sh
	# directoryの権限修正
	@chmod 755 /opt/homebrew/share
	@echo "dotfilesの配置が完了しました。"

.PHONY: mise
mise:
	@cd $${HOME} && mise install
	@echo "mise installが完了しました。"

# 実行しているターミナルにFull Disk Accessを許可してから実行
.PHONY: safari
safari:
	@defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool true
	@defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
	@echo "Safariの起動時の挙動、およびURL表示設定を修正しました。"

.PHONY: mac-system
mac-system:
	@bash mac-system.sh
