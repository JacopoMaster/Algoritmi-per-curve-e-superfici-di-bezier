import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

def de_casteljau_surface(control_points, u, v):
    """Calculate a point on a Bézier surface using de Casteljau's algorithm."""
    def de_casteljau_1d(points, t):
        n = len(points)
        for r in range(1, n):
            points = [(1 - t) * points[i] + t * points[i + 1] for i in range(n - r)]
        return points[0]

    rows = [de_casteljau_1d(row, u) for row in control_points]
    return de_casteljau_1d(rows, v)

def subdivide_surface(control_points, direction):
    """Subdivide the Bézier surface in the given direction (0 for u, 1 for v)."""
    def split(points, t):
        left = []
        right = []
        n = len(points)
        for i in range(n):
            left.append(points[0])
            right.append(points[-1])
            points = [(1 - t) * points[j] + t * points[j + 1] for j in range(len(points) - 1)]
        return left, right

    if direction == 0:  # subdivide in u direction
        left_points = []
        right_points = []
        for row in control_points:
            left, right = split(row, 0.5)
            left_points.append(left)
            right_points.append(right)
        return np.array(left_points), np.array(right_points)
    elif direction == 1:  # subdivide in v direction
        transposed = control_points.transpose(1, 0, 2)
        left_points = []
        right_points = []
        for row in transposed:
            left, right = split(row, 0.5)
            left_points.append(left)
            right_points.append(right)
        left_points = np.array(left_points).transpose(1, 0, 2)
        right_points = np.array(right_points).transpose(1, 0, 2)
        return left_points, right_points

def plot_surface(ax, control_points, color='b'):
    """Plot the Bézier surface using de Casteljau's algorithm."""
    u_values = np.linspace(0, 1, 20)
    v_values = np.linspace(0, 1, 20)
    U, V = np.meshgrid(u_values, v_values)
    surface_points = np.array([de_casteljau_surface(control_points, u, v) for u, v in zip(U.flatten(), V.flatten())])
    X = surface_points[:, 0].reshape(U.shape)
    Y = surface_points[:, 1].reshape(U.shape)
    Z = surface_points[:, 2].reshape(U.shape)
    ax.plot_surface(X, Y, Z, color=color, alpha=0.6)

# Definire i punti di controllo della superficie di Bézier 3D
control_points = np.array([
    [[0, 0, 0], [0, 1, 1], [0, 2, 0]],
    [[1, 0, 1], [1, 1, 2], [1, 2, 1]],
    [[2, 0, 0], [2, 1, 1], [2, 2, 0]]
])

# Creare la figura per la superficie originale
fig1 = plt.figure(figsize=(6, 6))
ax1 = fig1.add_subplot(111, projection='3d')
plot_surface(ax1, control_points, color='blue')
ax1.set_title('Superficie Bézier Originale')
plt.show()

# Subdivisione della superficie lungo la direzione u
left_points_u, right_points_u = subdivide_surface(control_points, direction=0)

# Subdivisione delle superfici ottenute lungo la direzione v
top_left_points, bottom_left_points = subdivide_surface(left_points_u, direction=1)
top_right_points, bottom_right_points = subdivide_surface(right_points_u, direction=1)

# Creare la figura per le superfici suddivise
fig2 = plt.figure(figsize=(12, 12))

# Subplot per top left surface
ax2 = fig2.add_subplot(221, projection='3d')
plot_surface(ax2, top_left_points, color='red')
ax2.set_title('Superficie in basso a sinistra')

# Subplot per bottom left surface
ax3 = fig2.add_subplot(222, projection='3d')
plot_surface(ax3, bottom_left_points, color='green')
ax3.set_title('Superficie in basso a destra')

# Subplot per top right surface
ax4 = fig2.add_subplot(223, projection='3d')
plot_surface(ax4, top_right_points, color='purple')
ax4.set_title('Superficie in alto a sinistra')

# Subplot per bottom right surface
ax5 = fig2.add_subplot(224, projection='3d')
plot_surface(ax5, bottom_right_points, color='orange')
ax5.set_title('Superficie in alto a destra')

plt.show()

# Creare la figura per l'unione delle superfici suddivise
fig3 = plt.figure(figsize=(8, 8))
ax6 = fig3.add_subplot(111, projection='3d')

plot_surface(ax6, top_left_points, color='red')
plot_surface(ax6, bottom_left_points, color='green')
plot_surface(ax6, top_right_points, color='purple')
plot_surface(ax6, bottom_right_points, color='orange')

ax6.set_title('Unione delle superfici suddivise')
plt.show()





