"""Generate beginner example figure."""
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np

fig, ax = plt.subplots(figsize=(10, 6))
ax.set_xlim(0, 10)
ax.set_ylim(0, 6)

# Background gradient
for i in range(60):
    color = plt.cm.Blues(0.05 + i * 0.015)
    rect = patches.Rectangle((0, i/10), 10, 0.1,
                               facecolor=color, edgecolor='none')
    ax.add_patch(rect)

# Title
ax.text(5, 5.2, 'Hebrew Academic Template', fontsize=22, fontweight='bold',
        ha='center', va='center', color='white')
ax.text(5, 4.5, 'Beginner Example Figure', fontsize=14,
        ha='center', va='center', color='white', alpha=0.9)

# Three feature boxes
features = [
    ('Hebrew RTL', '#E3F2FD', 1.5),
    ('English LTR', '#FFF3E0', 5),
    ('Mixed Content', '#E8F5E9', 8.5),
]

for label, color, x in features:
    box = patches.FancyBboxPatch((x-1.2, 2), 2.4, 1.5,
                                  boxstyle="round,pad=0.05",
                                  facecolor=color, edgecolor='#1565C0',
                                  linewidth=2)
    ax.add_patch(box)
    ax.text(x, 2.75, label, fontsize=11, fontweight='bold',
            ha='center', va='center', color='#1565C0')

# Arrows connecting boxes
for x1, x2 in [(2.7, 3.8), (6.2, 7.3)]:
    ax.annotate('', xy=(x2, 2.75), xytext=(x1, 2.75),
                arrowprops=dict(arrowstyle='->', lw=2, color='#1565C0'))

# Bottom label
ax.text(5, 0.8, 'Seamless Bidirectional Text Support', fontsize=12,
        ha='center', va='center', color='white', style='italic')

ax.axis('off')
plt.tight_layout()
plt.savefig('fig_beginner.pdf', bbox_inches='tight', dpi=300)
plt.savefig('fig_beginner.png', bbox_inches='tight', dpi=300)
print("Generated: fig_beginner.pdf, fig_beginner.png")
