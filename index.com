<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Système de Distribution des Jetons d'Examen</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
    <style>
        .gradient-bg {
            background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
        }
        .card-hover {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }
        .pulse {
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
</head>
<body class="bg-gray-50 min-h-screen">
    <!-- Header -->
    <header class="gradient-bg text-white shadow-lg">
        <div class="container mx-auto px-4 py-6">
            <div class="flex justify-between items-center">
                <div class="flex items-center space-x-3">
                    <i class="fas fa-graduation-cap text-3xl"></i>
                    <h1 class="text-2xl font-bold">UNIVERSITÉ ESPOR D'AFRIQUE</h1>
                </div>
                <div class="hidden md:flex items-center space-x-4">
                    <span class="text-sm font-medium">Service des Examens</span>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="container mx-auto px-4 py-8">
        <div class="text-center mb-12">
            <h2 class="text-3xl font-bold text-gray-800 mb-2">Système de Distribution des Jetons d'Examen</h2>
            <p class="text-gray-600 max-w-2xl mx-auto">Solution automatisée pour accélérer la distribution des jetons aux étudiants en règle de paiement</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12">
            <!-- Student Card -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <div class="p-6">
                    <div class="flex justify-center mb-4">
                        <div class="bg-blue-100 p-4 rounded-full">
                            <i class="fas fa-user-graduate text-blue-600 text-3xl"></i>
                        </div>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 text-center mb-2">Étudiant</h3>
                    <p class="text-gray-600 text-center mb-4">Vérifiez votre éligibilité et obtenez votre jeton d'examen en ligne</p>
                    <button onclick="toggleStudentModal()" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-4 rounded-lg transition duration-300">
                        Accéder
                    </button>
                </div>
            </div>

            <!-- Admin Card -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <div class="p-6">
                    <div class="flex justify-center mb-4">
                        <div class="bg-purple-100 p-4 rounded-full">
                            <i class="fas fa-user-shield text-purple-600 text-3xl"></i>
                        </div>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 text-center mb-2">Administration</h3>
                    <p class="text-gray-600 text-center mb-4">Gérez la distribution des jetons et surveillez les statistiques</p>
                    <button onclick="toggleAdminModal()" class="w-full bg-purple-600 hover:bg-purple-700 text-white font-medium py-2 px-4 rounded-lg transition duration-300">
                        Connexion
                    </button>
                </div>
            </div>

            <!-- QR Scanner Card -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <div class="p-6">
                    <div class="flex justify-center mb-4">
                        <div class="bg-green-100 p-4 rounded-full">
                            <i class="fas fa-qrcode text-green-600 text-3xl"></i>
                        </div>
                    </div>
                    <h3 class="text-xl font-semibold text-gray-800 text-center mb-2">Scanner QR</h3>
                    <p class="text-gray-600 text-center mb-4">Validez les jetons directement avec notre scanner intégré</p>
                    <button onclick="toggleScannerModal()" class="w-full bg-green-600 hover:bg-green-700 text-white font-medium py-2 px-4 rounded-lg transition duration-300">
                        Scanner
                    </button>
                </div>
            </div>
        </div>

        <!-- Benefits Section -->
        <div class="bg-white rounded-xl shadow-md p-8 mb-12">
            <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">Avantages de Notre Solution</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="flex flex-col items-center text-center p-4">
                    <div class="bg-blue-100 p-3 rounded-full mb-4">
                        <i class="fas fa-clock text-blue-600 text-2xl"></i>
                    </div>
                    <h3 class="font-semibold text-lg mb-2">Gain de Temps</h3>
                    <p class="text-gray-600">Réduction du temps d'attente de plusieurs heures à quelques minutes</p>
                </div>
                <div class="flex flex-col items-center text-center p-4">
                    <div class="bg-purple-100 p-3 rounded-full mb-4">
                        <i class="fas fa-mobile-alt text-purple-600 text-2xl"></i>
                    </div>
                    <h3 class="font-semibold text-lg mb-2">Accès Mobile</h3>
                    <p class="text-gray-600">Obtenez votre jeton depuis votre smartphone sans faire la queue</p>
                </div>
                <div class="flex flex-col items-center text-center p-4">
                    <div class="bg-green-100 p-3 rounded-full mb-4">
                        <i class="fas fa-chart-line text-green-600 text-2xl"></i>
                    </div>
                    <h3 class="font-semibold text-lg mb-2">Suivi en Temps Réel</h3>
                    <p class="text-gray-600">L'administration peut suivre la distribution des jetons en direct</p>
                </div>
            </div>
        </div>
    </main>

    <!-- Student Modal -->
    <div id="studentModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 hidden">
        <div class="bg-white rounded-xl shadow-2xl w-full max-w-md mx-4">
            <div class="p-6">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-xl font-bold text-gray-800">Obtenir Votre Jeton</h3>
                    <button onclick="toggleStudentModal()" class="text-gray-500 hover:text-gray-700">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                
                <div class="mb-6">
                    <label for="studentId" class="block text-sm font-medium text-gray-700 mb-1">Numéro d'Étudiant</label>
                    <input type="text" id="studentId" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="Entrez votre numéro d'étudiant">
                </div>
                
                <div class="mb-6">
                    <label for="studentPin" class="block text-sm font-medium text-gray-700 mb-1">Code PIN</label>
                    <input type="password" id="studentPin" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="Entrez votre code PIN">
                </div>
                
                <button onclick="checkEligibility()" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-4 rounded-lg transition duration-300 mb-4">
                    Vérifier l'Éligibilité
                </button>
                
                <div id="studentResult" class="hidden">
                    <div class="border-t pt-4 mt-4">
                        <div id="eligibleMessage" class="hidden">
                            <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-4">
                                <div class="flex items-center">
                                    <i class="fas fa-check-circle mr-2"></i>
                                    <p class="font-medium">Félicitations! Vous êtes éligible pour recevoir un jeton d'examen.</p>
                                </div>
                            </div>
                            <button onclick="generateToken()" class="w-full bg-green-600 hover:bg-green-700 text-white font-medium py-2 px-4 rounded-lg transition duration-300 mb-4 pulse">
                                <i class="fas fa-download mr-2"></i> Télécharger le Jeton
                            </button>
                            <div class="text-sm text-gray-500">
                                <p>Vous pouvez également présenter ce code QR lors de votre examen :</p>
                                <div class="flex justify-center mt-2">
                                    <div id="studentQrCode" class="p-2 bg-white border border-gray-200"></div>
                                </div>
                            </div>
                        </div>
                        
                        <div id="notEligibleMessage" class="hidden">
                            <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4">
                                <div class="flex items-center">
                                    <i class="fas fa-exclamation-circle mr-2"></i>
                                    <p class="font-medium">Désolé, vous n'êtes pas éligible pour recevoir un jeton d'examen.</p>
                                </div>
                                <p class="text-sm mt-2">Veuillez régulariser votre situation auprès du service financier.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Admin Modal -->
    <div id="adminModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 hidden">
        <div class="bg-white rounded-xl shadow-2xl w-full max-w-md mx-4">
            <div class="p-6">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-xl font-bold text-gray-800">Connexion Administration</h3>
                    <button onclick="toggleAdminModal()" class="text-gray-500 hover:text-gray-700">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                
                <div class="mb-6">
                    <label for="adminUsername" class="block text-sm font-medium text-gray-700 mb-1">Nom d'utilisateur</label>
                    <input type="text" id="adminUsername" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-purple-500" placeholder="Entrez votre nom d'utilisateur">
                </div>
                
                <div class="mb-6">
                    <label for="adminPassword" class="block text-sm font-medium text-gray-700 mb-1">Mot de passe</label>
                    <input type="password" id="adminPassword" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-purple-500" placeholder="Entrez votre mot de passe">
                </div>
                
                <button onclick="adminLogin()" class="w-full bg-purple-600 hover:bg-purple-700 text-white font-medium py-2 px-4 rounded-lg transition duration-300">
                    Se Connecter
                </button>
                
                <div id="adminDashboard" class="hidden mt-6">
                    <div class="border-t pt-4">
                        <h4 class="font-semibold text-lg mb-4">Tableau de Bord Administrateur</h4>
                        
                        <div class="grid grid-cols-2 gap-4 mb-6">
                            <div class="bg-blue-50 p-3 rounded-lg">
                                <p class="text-sm text-blue-800">Jetons Générés</p>
                                <p class="text-2xl font-bold text-blue-600" id="tokensGenerated">0</p>
                            </div>
                            <div class="bg-green-50 p-3 rounded-lg">
                                <p class="text-sm text-green-800">Étudiants Éligibles</p>
                                <p class="text-2xl font-bold text-green-600" id="eligibleStudents">0</p>
                            </div>
                        </div>
                        
                        <div class{"ok":false,"message":"terminated"}
</body>
</html>
