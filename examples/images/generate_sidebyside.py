"""Generate side-by-side figures."""
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 5))

# Left figure - Bar chart
categories = ['Cat A', 'Cat B', 'Cat C', 'Cat D']
values = [25, 40, 30, 55]
colors = ['#1E88E5', '#43A047', '#FB8C00', '#E53935']
ax1.bar(categories, values, color=colors, edgecolor='white', linewidth=2)
ax1.set_ylabel('Value', fontsize=12)
ax1.set_title('Left Figure - Bar Chart', fontsize=14, fontweight='bold')
ax1.grid(axis='y', alpha=0.3)

# Right figure - Pie chart
sizes = [30, 25, 20, 25]
labels = ['Part A', 'Part B', 'Part C', 'Part D']
explode = (0.05, 0.05, 0.05, 0.05)
ax2.pie(sizes, explode=explode, labels=labels, colors=colors,
        autopct='%1.0f%%', startangle=90,
        wedgeprops=dict(edgecolor='white', linewidth=2))
ax2.set_title('Right Figure - Pie Chart', fontsize=14, fontweight='bold')

plt.tight_layout()
plt.savefig('fig_sidebyside.pdf', bbox_inches='tight', dpi=300)
plt.savefig('fig_sidebyside.png', bbox_inches='tight', dpi=300)
print("Generated: fig_sidebyside.pdf, fig_sidebyside.png")
