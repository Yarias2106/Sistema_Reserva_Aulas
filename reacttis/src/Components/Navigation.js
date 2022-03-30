import React from 'react';
import '../App'
import logo from '../img/logoUmss.jpg'
import '../css/nav.css'

class Navigation extends React.Component {
    render() {
        return (
        <nav className="navbar navbar-expand-lg navbar-light bg-light py-0 navColor">
            <div className="container-fluid  ">

            <a className="navbar-brand" href="#">
                    <img src={logo} alt="Logo" className="img-fluid logou" />
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
                <div className="collapse navbar-collapse ms-lg-3" id="navbarTogglerDemo03">
                        <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                            <li className="nav-item">
                                <a className="nav-link active  pe-2" aria-current="page" href="#">Inicio</a>
                            </li>
                            <li className="nav-item">
                                <a className="nav-link active pe-2" href="#">Acerca de </a>
                            </li>
                            <li className="nav-item">
                                <a className="nav-link active  pe-2" href="#">Contactanos </a>
                            </li>
                        </ul>
                </div>
            </div>
        </nav>
        );
    }
}

export default Navigation;