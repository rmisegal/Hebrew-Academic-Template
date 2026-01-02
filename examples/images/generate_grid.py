"""Generate 2x2 grid of figures."""
import matplotlib.pyplot as plt
import numpy as np

fig, axes = plt.subplots(2, 2, figsize=(10, 8))

# Figure 1 - Scatter plot
np.random.seed(42)
x1 = np.random.randn(50)
y1 = x1 + np.random.randn(50) * 0.5
axes[0, 0].scatter(x1, y1, c='#1E88E5', alpha=0.7, s=60)
axes[0, 0].set_title('Figure 1: Scatter Plot', fontweight='bold')
axes[0, 0].set_xlabel('X Axis')
axes[0, 0].set_ylabel('Y Axis')
axes[0, 0].grid(alpha=0.3)

# Figure 2 - Histogram
data = np.random.normal(0, 1, 500)
axes[0, 1].hist(data, bins=25, color='#43A047', edgecolor='white', alpha=0.8)
axes[0, 1].set_title('Figure 2: Histogram', fontweight='bold')
axes[0, 1].set_xlabel('Value')
axes[0, 1].set_ylabel('Frequency')

# Figure 3 - Line plot
x3 = np.linspace(0, 4*np.pi, 100)
axes[1, 0].plot(x3, np.sin(x3), color='#FB8C00', linewidth=2, label='sin(x)')
axes[1, 0].plot(x3, np.cos(x3), color='#E53935', linewidth=2, label='cos(x)')
axes[1, 0].set_title('Figure 3: Trigonometric', fontweight='bold')
axes[1, 0].set_xlabel('X')
axes[1, 0].set_ylabel('Y')
axes[1, 0].legend()
axes[1, 0].grid(alpha=0.3)

# Figure 4 - Box plot
data4 = [np.random.normal(0, std, 100) for std in [1, 2, 3, 4]]
bp = axes[1, 1].boxplot(data4, patch_artist=True)
colors = ['#E3F2FD', '#E8F5E9', '#FFF3E0', '#FCE4EC']
for patch, color in zip(bp['boxes'], colors):
    patch.set_facecolor(color)
axes[1, 1].set_title('Figure 4: Box Plot', fontweight='bold')
axes[1, 1].set_xlabel('Group')
axes[1, 1].set_ylabel('Value')
axes[1, 1].set_xticklabels(['G1', 'G2', 'G3', 'G4'])

plt.tight_layout()
plt.savefig('fig_grid.pdf', bbox_inches='tight', dpi=300)
plt.savefig('fig_grid.png', bbox_inches='tight', dpi=300)
print("Generated: fig_grid.pdf, fig_grid.png")
