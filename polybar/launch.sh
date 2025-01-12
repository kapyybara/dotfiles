# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $USER -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar --reload mybar  --config=./config.ini &

echo "Polybar launched..."
