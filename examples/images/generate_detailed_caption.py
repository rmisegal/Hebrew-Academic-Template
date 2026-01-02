"""Generate detailed caption example figure."""
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np

fig, ax = plt.subplots(figsize=(10, 6))
ax.set_xlim(0, 10)
ax.set_ylim(0, 6)

# Create gradient background
for i in range(60):
    color = plt.cm.Purples(0.1 + i * 0.012)
    rect = patches.Rectangle((0, i/10), 10, 0.1,
                               facecolor=color, edgecolor='none')
    ax.add_patch(rect)

# Add formula visualization
ax.text(5, 4.5, r'$y = mx + b$', fontsize=36, ha='center', va='center',
        color='white', fontweight='bold')
ax.text(5, 3, 'Linear Equation', fontsize=18, ha='center', va='center',
        color='white')

# Add small coordinate system
ax.plot([1, 4], [1, 1], 'w-', linewidth=2)
ax.plot([1, 1], [1, 2.5], 'w-', linewidth=2)
ax.annotate('', xy=(4, 1), xytext=(1, 1),
            arrowprops=dict(arrowstyle='->', lw=2, color='white'))
ax.annotate('', xy=(1, 2.5), xytext=(1, 1),
            arrowprops=dict(arrowstyle='->', lw=2, color='white'))
ax.plot([1.5, 3.5], [1.3, 2.3], 'y-', linewidth=3)
ax.text(1, 0.6, 'x', fontsize=14, color='white', fontweight='bold')
ax.text(0.6, 2.5, 'y', fontsize=14, color='white', fontweight='bold')

ax.text(5, 0.5, 'Detailed Caption Example', fontsize=12,
        ha='center', va='center', color='white', alpha=0.8)

ax.axis('off')
plt.tight_layout()
plt.savefig('fig_detailed.pdf', bbox_inches='tight', dpi=300)
plt.savefig('fig_detailed.png', bbox_inches='tight', dpi=300)
print("Generated: fig_detailed.pdf, fig_detailed.png")
