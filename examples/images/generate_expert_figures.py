"""Generate expert example figures."""
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np

# Figure 1: Expert Command Demo
fig, ax = plt.subplots(figsize=(10, 6))
ax.set_xlim(0, 10)
ax.set_ylim(0, 6)

# Background gradient
for i in range(60):
    color = plt.cm.Purples(0.05 + i * 0.015)
    rect = patches.Rectangle((0, i/10), 10, 0.1,
                               facecolor=color, edgecolor='none')
    ax.add_patch(rect)

# Title
ax.text(5, 5.2, 'Expert Template Commands', fontsize=22, fontweight='bold',
        ha='center', va='center', color='white')
ax.text(5, 4.5, 'Command Form Figure', fontsize=14,
        ha='center', va='center', color='white', alpha=0.9)

# Command boxes
commands = [
    ('Text', '#E8EAF6', 1.5),
    ('Tables', '#FFF8E1', 3.5),
    ('Code', '#E8F5E9', 5.5),
    ('Math', '#FCE4EC', 7.5),
]

for label, color, x in commands:
    box = patches.FancyBboxPatch((x-0.8, 2), 1.6, 1.5,
                                  boxstyle="round,pad=0.05",
                                  facecolor=color, edgecolor='#512DA8',
                                  linewidth=2)
    ax.add_patch(box)
    ax.text(x, 2.75, label, fontsize=11, fontweight='bold',
            ha='center', va='center', color='#512DA8')

ax.text(5, 0.8, '78 Commands Available', fontsize=12,
        ha='center', va='center', color='white', style='italic')

ax.axis('off')
plt.tight_layout()
plt.savefig('fig_expert1.pdf', bbox_inches='tight', dpi=300)
plt.savefig('fig_expert1.png', bbox_inches='tight', dpi=300)
print("Generated: fig_expert1.pdf, fig_expert1.png")
plt.close()

# Figure 2: Environment Form Demo
fig, ax = plt.subplots(figsize=(10, 6))
ax.set_xlim(0, 10)
ax.set_ylim(0, 6)
ax.set_facecolor('#FAFAFA')

# Main frame
rect = patches.FancyBboxPatch((0.5, 0.5), 9, 5,
                               boxstyle="round,pad=0.05",
                               facecolor='white', edgecolor='#1976D2',
                               linewidth=3)
ax.add_patch(rect)

ax.text(5, 4.5, 'Environment Form Figure', fontsize=20, fontweight='bold',
        ha='center', va='center', color='#1976D2')
ax.text(5, 3.7, 'LaTeX Figure Environment', fontsize=14,
        ha='center', va='center', color='#666666')

# Feature icons
features = ['centering', 'includegraphics', 'caption', 'label']
for i, feat in enumerate(features):
    x = 2 + i * 2
    box = patches.FancyBboxPatch((x-0.7, 1.5), 1.4, 1.2,
                                  boxstyle="round,pad=0.02",
                                  facecolor='#E3F2FD', edgecolor='#1976D2',
                                  linewidth=1)
    ax.add_patch(box)
    ax.text(x, 2.1, feat, fontsize=9, ha='center', va='center', color='#1976D2')

ax.axis('off')
plt.tight_layout()
plt.savefig('fig_expert2.pdf', bbox_inches='tight', dpi=300)
plt.savefig('fig_expert2.png', bbox_inches='tight', dpi=300)
print("Generated: fig_expert2.pdf, fig_expert2.png")
