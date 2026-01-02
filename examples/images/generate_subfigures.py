"""Generate subfigures (a, b, c, d)."""
import matplotlib.pyplot as plt
import numpy as np

fig, axes = plt.subplots(2, 2, figsize=(10, 8))

colors = ['#1E88E5', '#43A047', '#FB8C00', '#E53935']
labels = ['(a) Subfigure A', '(b) Subfigure B', '(c) Subfigure C', '(d) Subfigure D']

np.random.seed(123)

# Subfigure (a) - Area chart
x = np.linspace(0, 10, 50)
y = np.sin(x) + 2
axes[0, 0].fill_between(x, y, alpha=0.5, color=colors[0])
axes[0, 0].plot(x, y, color=colors[0], linewidth=2)
axes[0, 0].set_title(labels[0], fontsize=12, fontweight='bold')
axes[0, 0].set_xlabel('Time')
axes[0, 0].set_ylabel('Amplitude')

# Subfigure (b) - Contour
x = np.linspace(-3, 3, 100)
y = np.linspace(-3, 3, 100)
X, Y = np.meshgrid(x, y)
Z = np.exp(-(X**2 + Y**2))
cs = axes[0, 1].contourf(X, Y, Z, levels=15, cmap='Greens')
axes[0, 1].set_title(labels[1], fontsize=12, fontweight='bold')
axes[0, 1].set_xlabel('X')
axes[0, 1].set_ylabel('Y')

# Subfigure (c) - Stem plot
x = np.arange(0, 20)
y = np.sin(x/2) * np.exp(-x/10)
markerline, stemlines, baseline = axes[1, 0].stem(x, y)
plt.setp(stemlines, color=colors[2], linewidth=1.5)
plt.setp(markerline, color=colors[2], markersize=6)
axes[1, 0].set_title(labels[2], fontsize=12, fontweight='bold')
axes[1, 0].set_xlabel('Sample')
axes[1, 0].set_ylabel('Value')

# Subfigure (d) - Heatmap
data = np.random.rand(8, 8)
im = axes[1, 1].imshow(data, cmap='Reds', aspect='auto')
axes[1, 1].set_title(labels[3], fontsize=12, fontweight='bold')
axes[1, 1].set_xlabel('Column')
axes[1, 1].set_ylabel('Row')

plt.tight_layout()
plt.savefig('fig_subfigures.pdf', bbox_inches='tight', dpi=300)
plt.savefig('fig_subfigures.png', bbox_inches='tight', dpi=300)
print("Generated: fig_subfigures.pdf, fig_subfigures.png")
